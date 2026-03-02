with orders as (
    select * from {{ ref('fct_orders' )}}
),

customer_orders_summary as (
    select 
        customer_id,
        count(order_id) as total_orders,
        min(ordered_at) as first_order_date,
        max(ordered_at) as last_order_date,
        sum(subtotal) as lifetime_spend_pretax,
        sum(tax_paid) as lifetime_tax_paid,
        sum(order_total) as lifetime_spend
    from orders

    group by customer_id
)
select * from customer_orders_summary