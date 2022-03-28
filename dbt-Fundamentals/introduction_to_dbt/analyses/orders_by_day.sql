-- these are not models, not tests. Just sql queries.

with orders as (
    select * from {{ ref('stg_orders') }}
)

select * from orders