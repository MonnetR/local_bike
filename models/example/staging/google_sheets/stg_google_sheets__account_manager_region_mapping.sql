SELECT 
    account_manager,
    state
FROM {{ source('google_sheets', 'account_manager_region_mapping') }}