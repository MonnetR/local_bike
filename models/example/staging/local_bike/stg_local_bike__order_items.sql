SELECT 
    CONCAT(item_id, '-', order_id) AS order_item_id,
    item_id,
    order_id,
    product_id,
    quantity,
    list_price AS price,
    discount,
    {{ calculate_total_order_item_amount_with_discount('list_price', 'quantity', 'discount') }} AS total_price
FROM {{ source('local_bike', 'order_items') }}