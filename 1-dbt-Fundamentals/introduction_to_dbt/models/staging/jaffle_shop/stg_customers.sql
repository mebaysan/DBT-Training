with customers as (
    
    select 
        "ID" as "CUSTOMER_ID",
        "FIRST_NAME",
        "LAST_NAME"

    from jaffle_shop.customers -- this schema comes from the db that dbt connected by using the profiles.yml file
)

select * from customers