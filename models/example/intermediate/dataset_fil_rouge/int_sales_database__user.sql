
WITH 
    orders_summary AS (
        SELECT
            o.user_name,
            SUM((oi.price * quantity) + oi.shipping_cost) AS total_amount_spent,
            SUM(oi.quantity) as total_items,
            COUNT(distinct product_id) as total_distinct_items,
            COUNT(DISTINCT o.order_id) AS total_orders
        FROM {{ ref("stg_sales_database__order_item") }} AS oi
        INNER JOIN {{ ref("stg_sales_database__order") }} AS o
            ON oi.order_id = o.order_id
        GROUP BY o.user_name
    ),
    product_summary AS (
        SELECT
            o.user_name,
            oi.product_id,
            ROW_NUMBER() OVER (
            PARTITION BY o.user_name
            ORDER BY SUM(quantity) DESC
            ) AS rn
        FROM {{ ref("stg_sales_database__order_item") }} AS oi
        INNER JOIN {{ ref("stg_sales_database__order") }} AS o
            ON oi.order_id = o.order_id
        GROUP BY o.user_name, oi.product_id
    )
SELECT
    o.user_name,
    o.total_amount_spent,
    o.total_items,
    o.total_distinct_items,
    o.total_orders,
    p.product_id AS favorite_product_id
FROM orders_summary o
LEFT JOIN product_summary p
    ON o.user_name = p.user_name AND p.rn = 1