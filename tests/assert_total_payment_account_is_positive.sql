select
    order_id,
    total_order_amount
from {{ ref('int_sales_database__order') }}
where total_order_amount < 0