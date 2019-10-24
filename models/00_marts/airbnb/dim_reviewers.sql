select
    reviewer_id as id
  , reviewer_name
  , count(distinct id) as reviews
  , count(distinct listing_id) as listings_reviewed
  /*
    It would be cool to add:
    - Average nightly price of listings they've reviewed
    - Average ratings of listings they've reviewed
    - Most popular destinations (city, state, listing type)
    - Last stay information
    - First stay information
  */
from
    {{ ref('stg_reviews') }}
group by 1, 2
