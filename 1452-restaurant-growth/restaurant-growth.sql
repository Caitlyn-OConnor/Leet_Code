with daily_total as (
    select
        visited_on
        ,sum(amount) as daily_sum
    from customer
    group by visited_on
),

cte as (
select 
    visited_on
    , sum(daily_sum) over (
        order by visited_on 
        rows between 6 preceding and current row 
    ) as amount
    ,round(
        avg(
        cast( daily_sum as decimal (10,2))) 
        over (
        order by visited_on
        rows between 6 preceding and current row) 
        ,2) as average_amount
    , count(*) over(
        order by visited_on
        rows between 6 preceding and current row
    ) as cnt
from daily_total
)

select
    visited_on
    ,amount
    ,average_amount
from cte
where cnt = 7
order by visited_on