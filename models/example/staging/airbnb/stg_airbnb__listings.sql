SELECT
    id as listing_id, 
    host_id ,
    neighbourhood_cleansed , 
    room_type , 
    price , 
    minimum_nights , 
    number_of_reviews , 
    availability_365
FROM {{ source('airbnb', 'listings') }}