{{
  config(
    materialized = "table",
    cluster_by = "event_name",
  )
}}

SELECT
  event_name,
  DATETIME(TIMESTAMP_MICROS(event_timestamp)) AS event_date,
  user_pseudo_id,
  DATETIME(TIMESTAMP_MICROS(user_first_touch_timestamp)) AS user_first_touch_date,
  device.web_info.browser,
  traffic_source.medium,
  traffic_source.source,
  traffic_source.name,
  (
    SELECT
      value.int_value   #param data type
    FROM UNNEST(event_params)  #unnest the events
    WHERE key = 'ga_session_id'
  ) AS ga_session_id,
  (
    SELECT
      value.int_value   #param data type
    FROM UNNEST(event_params)  #unnest the events
    WHERE key = 'page_title'
  ) AS page_title,
  (
    SELECT
      value.string_value   #param data type
    FROM UNNEST(event_params)  #unnest the events
    WHERE key = 'page_location'
  ) AS page_location
FROM {{ source("googles_analytics_4", "events_20210131") }}