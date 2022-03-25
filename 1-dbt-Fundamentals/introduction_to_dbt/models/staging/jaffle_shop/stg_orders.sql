with orders as (
    
    select
        "ID" as "ORDER_ID",
        "USER_ID" as "CUSTOMER_ID",
        "ORDER_DATE",
        "STATUS"

    from jaffle_shop.orders -- this schema comes from the db that dbt connected by using the profiles.yml file
)

select * from orders