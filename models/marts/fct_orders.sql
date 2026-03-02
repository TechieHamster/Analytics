{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

with orders as (
    select * from {{ ref('stg_orders') }}
),

locations as (
    select * from {{ ref('stg_locations') }}
),

joined as (
    select 
        orders.order_id,
        orders.customer_id,
        orders.location_id,

        locations.location_name,

        orders.subtotal,
        orders.tax_paid,
        orders.order_total,

        orders.ordered_at
    
    from orders

    left join locations
        on orders.location_id = locations.location_id
)

select * from joined