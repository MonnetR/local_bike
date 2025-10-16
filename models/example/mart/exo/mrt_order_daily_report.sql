{{
  config(
    alias = "order_daily_report"
  )
}}

SELECT
  o.order_date,
  MAX(amrm.account_manager) AS account_manager,
  -- o.order_status,
  COUNT(DISTINCT o.order_id) AS total_order,
  AVG(o.average_feedback_score) AS average_feedback_score,
  AVG(o.total_order_amount) AS average_order_amount
FROM {{ ref("int_sales_database__order") }} AS o
LEFT JOIN {{ ref("stg_google_sheets__account_manager_region_mapping") }} AS amrm
  ON o.customer_city = amrm.state
GROUP BY o.order_date