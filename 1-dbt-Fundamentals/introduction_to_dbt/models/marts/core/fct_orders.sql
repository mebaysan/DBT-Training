with orders as  (
    select * from {{ ref('stg_orders' )}}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

order_payments as (
    select
        "ORDER_ID",
        sum(case when "STATUS" = 'success' then "AMOUNT" end) as "AMOUNT"

    from payments
    group by 1
),

final as (

    select
        orders."ORDER_ID",
        orders."CUSTOMER_ID",
        orders."ORDER_DATE",
        coalesce(order_payments."AMOUNT", 0) as "AMOUNT"

    from orders
    left join order_payments using ("ORDER_ID")
)

select * from final