SELECT song_id,
    title,
    UPPER(artist) as artist,
    album,
    release_year,
    COALESCE(genre, 'UNKNOWN') AS genre
FROM {{ source('dataset_session_3', 'songs') }}