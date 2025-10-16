with 
    order_item_grouped_by_order as (
        select order_id,
        SUM(total_price) AS total_order_amount,
        sum(quantity) as total_items,
        count(distinct product_id) as total_distinct_items
        from {{ ref('stg_local_bike__order_items') }}
        group by order_id
    )
select 
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_date,
    o.required_date,
    o.shipped_date,
    o.store_id,
    s.store_name,
    s.store_city,
    s.store_state,
    c.customer_city,
    c.customer_state,
    oi.total_order_amount,
    oi.total_items,
    oi.total_distinct_items
from {{ ref('stg_local_bike__orders') }} as o
left join order_item_grouped_by_order as oi on o.order_id = oi.order_id
left join {{ ref("stg_local_bike__customers") }} as c on c.customer_id = o.customer_id
left join {{ ref("stg_local_bike__stores") }} as s on s.store_id = o.store_id