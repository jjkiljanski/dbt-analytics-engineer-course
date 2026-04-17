select
    ID as payment_id,
    ORDERID as order_id,
    PAYMENTMETHOD as payment_method,
    STATUS as status,
    {{ cents_to_dollars("amount")}} as amount,
    created as created_at

    from {{source('stripe', 'payments')}}