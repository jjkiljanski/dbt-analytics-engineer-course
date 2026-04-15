{% set payment_methods = ['coupon', 'credit_card', 'gift_card', 'bank_transfer'] %}

with payments as
(
    select * from {{ref('stg_stripe__payments')}}
),
pivoted as (
    select
        order_id,        
        {% for method in payment_methods %}
        sum (case when payment_method = '{{ method }}' then amount else 0 end) as {{ method }}_amount
        {%- if not loop.last -%}
            ,
        {%- endif -%}
        {%- endfor -%}
    from payments
    group by order_id
)

select * from pivoted