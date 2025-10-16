SELECT
  user_pseudo_id,
  MAX(ga_session_id) AS ga_session_id,
  CONCAT(user_pseudo_id, MAX(ga_session_id)) AS unique_session_id,
  MIN(event_date) AS session_start_time,
  MAX(event_date) AS session_end_time,
  COUNT(event_name = 'page_view') AS pages_viewed,
  COUNT(event_name) AS event_count,
  MAX(browser) AS browser_used,
  MAX(medium) AS traffic_medium,
  MAX(source) AS traffic_source,
  MAX(name) AS traffic_name
FROM {{ ref("stg_google_analytics__event") }}
GROUP BY user_pseudo_id