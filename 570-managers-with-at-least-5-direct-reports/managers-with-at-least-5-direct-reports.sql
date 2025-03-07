with cte as (
select
    managerId
    ,count(managerId) count_manId
from employee
group by managerId
having count(managerId) > 4
)

select 
    e1.name
from Employee e1
inner join cte
    on e1.id = cte.managerid