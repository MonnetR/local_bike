select
    order_id,
    product_id,
    total_price
from {{ ref('stg_sales_database__order_item') }}
where total_price < 0