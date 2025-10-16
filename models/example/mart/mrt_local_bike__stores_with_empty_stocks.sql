with 
    stock_grouped_by_store as (
        select store_id,
        SUM(CASE WHEN stock_quantity = 0 THEN 1 ELSE 0 END) as total_products_stock_empty,
        SUM(CASE WHEN stock_quantity < 10 THEN 1 ELSE 0 END) as total_products_stock_less_than_10_units
        from {{ ref('stg_local_bike__stocks') }}
        group by store_id
    )
select 
    store.store_id,
    store.store_name,
    store.store_city,
    store.store_state,
    stock.total_products_stock_empty,
    stock.total_products_stock_less_than_10_units
from {{ ref('stg_local_bike__stores') }} as store
left join stock_grouped_by_store as stock on stock.store_id = store.store_id
order by stock.total_products_stock_empty, stock.total_products_stock_less_than_10_units