with cte as (
SELECT
    id
    ,num
    ,LEAD(num, 1, null) OVER (
        ORDER BY id
    ) AS second_num
    ,LEAD(num, 2, null) OVER (
        ORDER BY id
    ) AS third_num
FROM logs
)

select distinct
    num as ConsecutiveNums
from cte
where num=second_num and num=third_num and second_num=third_num