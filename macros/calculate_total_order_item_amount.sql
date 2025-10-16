{% macro calculate_total_order_item_amount(column_name_price, column_name_quantity, column_name_shipping_cost)%}
    ({{column_name_price}}*{{column_name_quantity}}) + {{column_name_shipping_cost}}
{% endmacro %}