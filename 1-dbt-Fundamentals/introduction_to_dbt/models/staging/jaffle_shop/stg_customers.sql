with customers as (
    
    select 
        "ID" as "CUSTOMER_ID",
        "FIRST_NAME",
        "LAST_NAME"

    from {{ source('jaffle_shop', 'customers') }} -- this comes from `src_jaffle_shop.yml` file
)

select * from customers