select payments.order_id,
    orders.customer_id,
    sum(payments.AMOUNT) as payment_amount
    from {{ref('base_stripe__payments')}} as payments
    inner join {{ref('stg_jaffle_shop__orders')}} as orders
    on payments.order_id = orders.order_id
    where payments.status = 'success'
    GROUP BY payments.order_id, orders.customer_id
