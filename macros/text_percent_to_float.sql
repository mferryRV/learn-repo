{% macro text_percent_to_float(column) %}
nullif(nullif(replace({{ column }}, '%', ''),''),'N/A')::integer/100
{% endmacro %}
