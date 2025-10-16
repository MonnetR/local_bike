SELECT 
    neighbourhood_cleansed,
    room_type,
    AVG(price) AS average_price
FROM {{ ref('stg_airbnb__listings')}}
GROUP BY neighbourhood_cleansed, room_type