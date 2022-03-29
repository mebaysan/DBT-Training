select 
    "ID" as "PAYMENT_ID",
    "ORDERID" as "ORDER_ID",
    "PAYMENTMETHOD" as "PAYMENT_METHOD",
    "STATUS",
    {{cents_to_dollars('"AMOUNT"',4)}} as "AMOUNT",
    "CREATED" as "CREATED_AT"
from {{ source('stripe','payments') }}
