/*
    Set all variables at the top
*/
{% set property_types = dbt_utils.get_column_values(table=ref('stg_listings'),column='property_type') %}

with listings as (
  /*
    Fishtown always starts by pulling in the datasets theyre going to work with
    Analagous to import statement in Python notebooks
  */
  select
      *
  from
      {{ ref('stg_listings') }}
),
pivoted as (
  select
      neighbourhood,
      {# {% for property_type in [
        'Guesthouse',
        'House',
        'Apartment',
        'Bed and breakfast',
        'Guest suite',
        'Cottage',
        'Townhouse',
        'Loft',
        'Condominium',
        'Bungalow',
        'Serviced apartment',
        'Tiny house',
        'Castle',
        'Other',
        'Hostel',
        'Villa',
        'Tent',
        'Plane',
        'Boutique hotel',
        'Farm stay',
        'Camper/RV'
      ] %} #}
      {%- for property_type in property_types -%}
      {#- {%- set property_type_cleaned =
          property_type | lower | replace(' ', '_') | replace('/','_')
      -%} -#}
      sum(case when property_type = '{{ property_type }}' then 1 else 0 end) as {{ clean_column_name(property_type) }}_count
      {%- if not loop.last -%},{%- endif -%}
      {# , if not loop.last #}
      {% endfor %}
  from
      listings
  group by 1
)

select * from pivoted
