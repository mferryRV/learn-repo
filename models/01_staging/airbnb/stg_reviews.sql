select
    nullif(id,'')::integer as id
  , nullif(listing_id,'')::integer as listing_id
  , date
  , review as reviewer_id
  , reviewer_name
  , comments
from
    {{ source('airbnb', 'reviews') }}
