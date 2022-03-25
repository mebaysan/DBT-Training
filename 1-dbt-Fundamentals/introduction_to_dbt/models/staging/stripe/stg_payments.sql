select 
    "ID" as "PAYMENT_ID",
    "ORDERID" as "ORDER_ID",
    "PAYMENTMETHOD" as "PAYMENT_METHOD",
    "STATUS",
    "AMOUNT" / 100 as "AMOUNT",
    "CREATED" as "CREATED_AT"
from stripe."payments"
