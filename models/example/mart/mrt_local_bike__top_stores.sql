SELECT 
    store_id,
    MAX(store_name) AS store_name,
    MAX(store_city) AS store_city,
    MAX(store_state) AS store_state,
    SUM(total_order_amount) AS total_orders_amount,
    COUNT(order_id) AS total_orders
FROM {{ ref('int_local_bike__orders')}}
GROUP BY store_id
ORDER BY SUM(total_order_amount) DESC
LIMIT 20