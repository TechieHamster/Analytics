with 

source as (

    select * from {{ source('ecom', 'raw_orders') }}

),

renamed as (

    select 
        id as order_id,
        stored_id as location_id,
        customer as customer_id,
        {{ cents_to_dollars('subtotal') }} as subtotal,
        {{ cents_to_dollars('tax_paid') }} as tax_paid,
        {{ cents_to_dollars('order_total') }} as order_total,
        ordered_at

    from source

)

select * from renamed