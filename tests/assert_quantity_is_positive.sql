select
    stock_id,
    stock_quantity
from {{ ref('stg_local_bike__stocks') }}
where stock_quantity < 0