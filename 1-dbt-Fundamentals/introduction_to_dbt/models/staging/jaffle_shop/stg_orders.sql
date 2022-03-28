with orders as (
    
    select
        "ID" as "ORDER_ID",
        "USER_ID" as "CUSTOMER_ID",
        "ORDER_DATE",
        "STATUS"

    from {{ source('jaffle_shop','orders') }}
)

select * from orders