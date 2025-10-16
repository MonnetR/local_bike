SELECT
    order_id,
    product_id,
    seller_id,
    DATETIME(pickup_limit_date) AS pickup_limit_date,
    price,
    shipping_cost,
    quantity,
    {{ calculate_total_order_item_amount('price', 'quantity', 'shipping_cost') }} AS total_price
FROM {{ source('dataset_fil_rouge', 'order_item') }}