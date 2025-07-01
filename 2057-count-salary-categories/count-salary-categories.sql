with cte as (
    select *
    , case 
        when income < 20000 then 'Low Salary'
        when income >= 20000 and income <= 50000 then 'Average Salary'
        when income > 50000 then 'High Salary'
        else null
        end as category
    from accounts
),

categories as (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
)

select
    categories.category
    , isnull(count(distinct cte.account_id),0) as accounts_count
from cte 
right join categories on categories.category = cte.category
group by categories.category