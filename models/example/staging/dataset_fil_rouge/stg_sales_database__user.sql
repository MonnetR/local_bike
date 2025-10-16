SELECT
    user_name,
    customer_zip_code,
    customer_city,
    customer_state,
    row_num
FROM {{ source('dataset_fil_rouge', 'user') }}