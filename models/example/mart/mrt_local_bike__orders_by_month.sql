{{ config(
    materialized='table'
)}}

SELECT 
	FORMAT_DATE('%Y-%m', order_date) AS year_month,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(total_order_amount), 2) AS total_orders_amount
FROM {{ ref('int_local_bike__orders')}}
GROUP BY FORMAT_DATE('%Y-%m', order_date)
ORDER BY FORMAT_DATE('%Y-%m', order_date)