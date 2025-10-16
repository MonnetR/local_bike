SELECT 
    artist,
    SUM(minutes_listened) AS total_minutes_listened
FROM {{ ref('int_dataset_session_3__song_listening')}}
GROUP BY artist
ORDER BY SUM(minutes_listened) DESC
LIMIT 20