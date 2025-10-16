SELECT s.song_id,
    ld.listen_date,
    ld.minutes_listened,
    s.title,
    s.artist,
    s.album,
    s.release_year,
    s.genre
FROM {{ ref('stg_dataset_session_3__songs') }} AS s
LEFT JOIN {{ ref('stg_dataset_session_3__listening_data') }} AS ld
    ON s.song_id = ld.song_id
WHERE ld.listen_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 2 YEAR)