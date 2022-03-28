-- we can create custom tests (singular test)

-- for this case, this query has to fetch 0 row to pass test
with payments as (
    select * from {{ ref('stg_payments') }}
)

select
    "ORDER_ID",
    sum("AMOUNT") as "TOTAL_AMOUNT"
from payments
group by "ORDER_ID"
having sum("AMOUNT") < 0