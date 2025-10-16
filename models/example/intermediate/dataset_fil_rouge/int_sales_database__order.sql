with 
    order_item_grouped_by_order as (
        select order_id,
        SUM((price * quantity) + shipping_cost) AS total_order_amount,
        sum(quantity) as total_items,
        count(distinct product_id) as total_distinct_items
        from {{ ref('stg_sales_database__order_item') }}
        group by order_id
    ), 
    feedback_grouped_by_order as (
        select order_id,
        avg(feedback_score) as average_feedback_score
        from {{ ref("stg_sales_database__feedback") }}
        group by order_id
    )
select 
    o.order_id,
    o.user_name,
    o.order_status,
    o.order_date,
    o.order_approved_date,
    u.customer_city,
    f.average_feedback_score,
    oi.total_order_amount,
    oi.total_items,
    oi.total_distinct_items
from {{ ref('stg_sales_database__order') }} as o
left join order_item_grouped_by_order as oi on o.order_id = oi.order_id
left join feedback_grouped_by_order as f on f.order_id = o.order_id
left join {{ ref("stg_sales_database__user") }} as u on u.user_name = o.user_name