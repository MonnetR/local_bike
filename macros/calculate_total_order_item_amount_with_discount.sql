{% macro calculate_total_order_item_amount_with_discount(price_column, quantity_column, discount_column)%}
    ROUND(({{price_column}}*(1-{{discount_column}}))*{{quantity_column}}, 2)
{% endmacro %}