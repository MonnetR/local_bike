SELECT 
    product_id,
    product_name,
    brand_id,
    category_id,
    model_year,
    list_price AS price
FROM {{ source('local_bike', 'products') }}