SELECT 
    staff_id,
    store_id,
    manager_id,
    first_name AS staff_first_name,
    last_name AS staff_last_name,
    email AS staff_email,
    phone AS staff_phone,
    active AS staff_active
FROM {{ source('local_bike', 'staffs') }}