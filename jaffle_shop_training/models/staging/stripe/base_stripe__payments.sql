with source as (
      select * from {{ source('stripe', 'payments') }}
),
renamed as (
    select
        {{ adapter.quote("ID") }} as payment_id,
        {{ adapter.quote("ORDERID") }} as order_id,
        {{ adapter.quote("PAYMENTMETHOD") }} as payment_method,
        {{ adapter.quote("STATUS") }},
        {{ adapter.quote("AMOUNT") }},
        {{ adapter.quote("CREATED") }},
        {{ adapter.quote("_BATCHED_AT") }}

    from source
)
select * from renamed
  