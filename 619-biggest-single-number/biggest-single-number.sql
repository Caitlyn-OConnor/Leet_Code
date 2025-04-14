WITH cte as (
    select num
    from MyNumbers
    group by num
    having COUNT(*) = 1
)
select MAX(num) as num
from cte


