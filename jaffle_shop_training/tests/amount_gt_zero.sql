select *
from {{ref('dim_customers')}}
where lifetime_value < 0