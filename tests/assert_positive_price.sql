select
    listing_id,
    price
from {{ ref('stg_airbnb__listings') }}
where price < 0