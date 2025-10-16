{% macro calculate_volume_product(length_column, width_column, height_column)%}
    {{length_column}}*{{width_column}}*{{height_column}}
{% endmacro %}