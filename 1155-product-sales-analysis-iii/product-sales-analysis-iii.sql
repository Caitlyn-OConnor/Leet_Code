with cte as (
    select
        product_id
        ,min(year) as min_year
    from sales 
    group by product_id
)

select 
    sales.product_id
    ,cte.min_year as first_year
    ,sales.quantity
    ,sales.price
from sales
inner join cte on cte.min_year = sales.year and cte.product_id=sales.product_id

