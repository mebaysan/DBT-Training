/*
{{ config (
    materialized="table"
) }} -- we need to set this if we want to transform it into a table instead of view
*/

with customers as (

     select * from {{ ref('stg_customers')}} -- we can use our other sql files we have coded by dbt. To do that we use ref with Jinja

),

orders as (

    select * from {{ ref('fct_orders') }}


),

customer_orders as (

    select
        "CUSTOMER_ID",
        min("ORDER_DATE") as "FIRST_ORDER_DATE",
        max("ORDER_DATE") as "MOST_RECENT_ORDER_DATE",
        count("ORDER_ID") as "NUMBER_OF_ORDERS",
        sum("AMOUNT") as "LIFETIME_VALUE"

    from orders

    group by 1

),


final as (

    select
        customers."CUSTOMER_ID",
        customers."FIRST_NAME",
        customers."LAST_NAME",
        customer_orders."FIRST_ORDER_DATE",
        customer_orders."MOST_RECENT_ORDER_DATE",
        coalesce(customer_orders."NUMBER_OF_ORDERS", 0) as "NUMBER_OF_ORDERS",
        customer_orders."LIFETIME_VALUE"

    from customers

    left join customer_orders using ("CUSTOMER_ID")

)

select * from final

