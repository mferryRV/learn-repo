select
    host_id as id
  , host_name
  , host_since
  , host_location
  , host_about
  , response_time
  , response_rate
  , is_superhost
  , host_has_profile_pic
  , host_identity_verified
  , count(distinct id) as listings
from
    {{ ref('stg_listings') }}
{{ group_by(10) }}
