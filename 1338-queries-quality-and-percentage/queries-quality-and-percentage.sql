with cte as (
select 
    query_name
    , result
    ,  sum(( convert(float,rating) / convert(float,position) ) )as quality
    , case 
        when sum(rating)<3 then 1
        else 0
        end as poor

from queries 
group by query_name, result
)

select 
    query_name
    ,round(sum(quality)/count(result),2) as quality
    ,round((convert(float,sum(poor))/convert(float,count(result)))*100,2) as poor_query_percentage
from cte
group by cte.query_name

