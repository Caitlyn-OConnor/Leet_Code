with cte as (
    select 
        sell_date
        ,product
    from activities
    group by sell_date,product
)

select 
    sell_date
    ,count(distinct product) as num_sold
    ,string_agg(product, ',') within group (order by product) as products
from cte
group by sell_date