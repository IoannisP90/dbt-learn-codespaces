-- declare the list of payment_methods at the top
-- remove the trailing comma
-- remove leading/trailing whitespace
-- Add a package that will select the values from a column - dbt hub 


select 
    order_id,

    {% for payment in ['credit_card', 'gift_card', 'bank_transfer', 'coupon'] %}

    sum(case when payment_method = '{{ payment }}' then AMOUNT end) as {{ payment }}_amount,

    {% endfor %}

from {{ ref('base_stripe__payments') }}
group by 1
