with 
    order_item_grouped_by_store as (
        select o.store_id,
        oi.product_id,
        ROW_NUMBER() OVER (
            PARTITION BY o.store_id
            ORDER BY SUM(oi.quantity) DESC
        ) AS rn,
        SUM(oi.quantity) AS total_quantity,
        MAX(store_name) AS store_name,
        MAX(store_city) AS store_city,
        MAX(store_state) AS store_state
        from {{ ref("stg_local_bike__order_items")}} AS oi
        left join {{ref ("int_local_bike__orders")}} AS o 
            on o.order_id = oi.order_id 
        group by o.store_id, oi.product_id
    )
SELECT 
    oigbs.store_id,
    oigbs.store_name,
    oigbs.store_city,
    oigbs.store_state,
    oigbs.total_quantity,
    p.product_id AS most_sold_product_id,
    p.product_name AS most_sold_product_name,
    p.brand_id AS most_sold_brand_id,
    p.brand_name AS most_sold_brand_name,
    p.category_id AS most_sold_category_id,
    p.category_name AS most_sold_category_name
FROM order_item_grouped_by_store AS oigbs
LEFT JOIN {{ ref("int_local_bike__products") }} AS p
    on oigbs.product_id = p.product_id
WHERE oigbs.rn = 1