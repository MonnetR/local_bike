select
    order_item_id,
    total_price
from {{ ref('stg_local_bike__order_items') }}
where total_price < 0