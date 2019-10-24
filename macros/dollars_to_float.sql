{% macro dollars_to_float(column) %}
nullif(replace(split_part({{ column }}, '$', 2), ',', ''), '')::float
{% endmacro %}}
