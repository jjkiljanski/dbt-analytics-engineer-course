select
    ID as customer_id,
    ORDERID as order_id,
    PAYMENTMETHOD as payment_method,
    STATUS as status,
    AMOUNT as amount,
    created as created_date

    from stripe.payment