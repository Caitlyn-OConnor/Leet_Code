-- -- select 
-- --     e1.name
-- -- from employee e1
-- -- inner join employee e2
-- --     on e1.id = e2.managerId
-- -- where e1.managerId is null
-- -- group by e1.name
-- -- having count(*)>4

-- with cte as (
-- select 
--      e1.name
--      ,count(e1.name) peepeepoopoo
--  from employee e1
--  inner join employee e2
--     on e1.id = e2.managerId
-- group by e1.name, e1.id
-- having count(e1.name)>4
-- )

-- select
--     cte.name
-- from cte;


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