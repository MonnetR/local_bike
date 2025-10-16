select 
    p.product_id,
    p.product_name,
    p.brand_id,
    b.brand_name,
    p.category_id,
    c.category_name,
    p.model_year,
    p.price
from {{ ref('stg_local_bike__products') }} as p
left join {{ ref("stg_local_bike__categories") }} as c on c.category_id = p.category_id
left join {{ ref("stg_local_bike__brands") }} as b on b.brand_id = p.brand_id