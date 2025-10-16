SELECT
    order_id,
    user_name,
    order_status,
    DATETIME(order_date) AS order_date,
    DATETIME(order_approved_date) AS order_approved_date,
    DATETIME(pickup_date) AS pickup_date,
    DATETIME(delivered_date) AS delivered_date,
    DATETIME(estimated_time_delivery) AS estimated_time_delivery
FROM {{ source('dataset_fil_rouge', 'order') }}