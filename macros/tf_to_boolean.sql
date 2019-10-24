{% macro tf_to_boolean(column) %}
case {{ column }} when 't' then TRUE when 'f' then FALSE else null end
{% endmacro %}
