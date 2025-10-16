select 
    {% for status in var('order_status_accepted_values_list') %}
    SUM(CASE WHEN order_status ='{{status}}' THEN total_order_amount END) AS total_{{status}}_orders_amount,
    {% endfor %}
from {{ ref("int_sales_database__order")}}