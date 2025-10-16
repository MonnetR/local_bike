SELECT song_id,
    DATETIME(listen_date) AS listen_date,
    COALESCE(minutes_listened, 0) AS minutes_listened
FROM {{ source('dataset_session_3', 'listening_data') }}