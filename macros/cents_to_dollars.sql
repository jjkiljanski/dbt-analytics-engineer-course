{%- macro cents_to_dollars(column, decimals=2) -%}
    round({{ column }} * 1.0 / 100, {{ decimals }})
{% endmacro %}