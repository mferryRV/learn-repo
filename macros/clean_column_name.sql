{%- macro clean_column_name(column_name) -%}
  {{- column_name | lower | replace(' ', '_') | replace('/','_') -}}
{%- endmacro -%}
