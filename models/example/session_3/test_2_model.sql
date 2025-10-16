select count(distinct order_id) as total_distinct_orders
from {{ ref("test_model") }}