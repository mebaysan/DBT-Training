{%- set payment_methods = ['bank_transfer', 'credit_card', 'coupon', 'gift_card'] -%}

-- `-` removes the white space

with payments as (
   select * from {{ ref('stg_payments') }}
),

final as (
   select
       "ORDER_ID",
       {% for payment_method in payment_methods -%}

       sum(case when "PAYMENT_METHOD" = '{{ payment_method }}' then "AMOUNT" else 0 end)
            as "{{ payment_method }}_amount"

       {%- if not loop.last -%}
         ,
       {% endif -%}

       {%- endfor %}
   from {{ ref('stg_payments') }}
   group by 1
)

select * from final
