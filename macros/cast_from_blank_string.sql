{% macro cast_from_blank_string(column, datatype) %}
-- This is deprecated by nullif(column,'')
case when {{ column }} = '' then null else {{ column }}::{{ datatype }} end
{% endmacro %}
