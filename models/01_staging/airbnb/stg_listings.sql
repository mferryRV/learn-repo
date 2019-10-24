select
    nullif(id,'')::integer as id
  , nullif(url,'') as url
  , nullif(name,'') as name
  , nullif(summary,'') as summary
  , nullif(space,'') as space
  , nullif(description,'') as description
  , nullif(experiences_offered,'') as experiences_offered
  , nullif(neighborhood_overview,'') as neighbourhood_overview
  , nullif(notes,'') as notes
  , nullif(transit,'') as transit
  , nullif(access,'') as access
  , nullif(interaction,'') as interaction
  , nullif(house_rules,'') as house_rules
  , nullif(host_id,'')::integer as host_id
  , nullif(host_name,'') as host_name
  , nullif(host_since,'')::date as host_since
  , nullif(host_location,'') as host_location
  , nullif(host_about,'') as host_about
  , nullif(response_time,'') as response_time
  , {{ text_percent_to_float('response_rate') }} as response_rate
  , {{ text_percent_to_float('acceptance_rate') }} as acceptance_rate
  , {{ tf_to_boolean('is_superhost') }} as is_superhost
  , nullif(host_neighbourhood,'') as host_neighbourhood
  , nullif(host_verifications,'') as host_verifications
  , {{ tf_to_boolean('host_has_profile_pic') }} as host_has_profile_pic
  , {{ tf_to_boolean('host_identity_verified') }} as host_identity_verified
  , nullif(street,'') as street
  , nullif(neighbourhood,'') as neighbourhood
  , nullif(neighbourhood_cleansed,'') as neighbourhood_cleansed
  , nullif(neighbourhood_group_cleansed,'') as neighbourhood_group_cleansed
  , nullif(city,'') as city
  , nullif(state,'') as state
  , nullif(zipcode,'')::integer as zipcode
  , nullif(market,'') as market
  , nullif(smart_location,'') as smart_location
  , nullif(country_code,'') as country_code
  , nullif(country,'') as country
  , nullif(latitude,'')::float as latitude
  , nullif(longitude,'')::float as longitude
  , {{ tf_to_boolean('is_location_exact') }} as is_location_exact
  , nullif(property_type,'') as property_type
  , nullif(room_type,'') as room_type
  , nullif(accommodates,'')::integer as accommodates
  , nullif(bathrooms,'')::integer as bathrooms
  , nullif(bedrooms,'')::integer as bedrooms
  , nullif(beds,'')::integer as beds
  , nullif(bed_type,'') as bed_type
  , nullif(amenities,'') as amenities
  , nullif(square_feet,'')::integer as square_feet
  , {{ dollars_to_float('price') }} as price_usd
  , {{ dollars_to_float('weekly_price') }} as weekly_price_usd
  , {{ dollars_to_float('monthly_price') }} as monthly_price_usd
  , {{ dollars_to_float('security_deposit') }} as security_deposit_usd
  , {{ dollars_to_float('cleaning_fee') }} as cleaning_fee_usd
  , nullif(guests_included,'')::integer as guests_included
  , {{ dollars_to_float('extra_people') }} as extra_people_usd
  , nullif(minimum_nights,'')::integer as minimum_nights
  , nullif(maximum_nights,'')::integer as maximum_nights
  , nullif(calendar_updated,'') as calendar_updated
  , {{ tf_to_boolean('has_availability') }} as has_availability
  , nullif(availability_30,'')::integer as availability_30
  , nullif(availability_60,'')::integer as availability_60
  , nullif(availability_90,'')::integer as availability_90
  , nullif(availability_365,'')::integer as availability_365
  , nullif(number_of_reviews,'')::integer as number_of_reviews
  , nullif(first_review,'')::date as first_review
  , nullif(last_review,'')::date as last_review
  , nullif(review_scores_rating,'')::integer as review_scores_rating
  , nullif(review_scores_accuracy,'')::integer as review_scores_accuracy
  , nullif(review_scores_cleanliness,'')::integer as review_scores_cleanliness
  , nullif(review_scores_checkin,'')::integer as review_scores_checkin
  , nullif(review_scores_communication,'')::integer as review_scores_communication
  , nullif(review_scores_location,'')::integer as review_scores_location
  , nullif(review_scores_value,'')::integer as review_scores_value
  , {{ tf_to_boolean('requires_license') }} as requires_license
  , nullif(license,'') as license
  , nullif(jurisdiction_names,'') as jurisdiction_names
  , {{ tf_to_boolean('instant_bookable') }} as instant_bookable
  , {{ tf_to_boolean('is_business_travel_ready') }} as is_business_travel_ready
  , nullif(cancellation_policy,'') as cancellation_policy
  , {{ tf_to_boolean('require_guest_profile_picture') }} as require_guest_profile_picture
  , {{ tf_to_boolean('require_guest_phone_verification') }} as require_guest_phone_verification
from
    {{ source('airbnb', 'listings') }}
