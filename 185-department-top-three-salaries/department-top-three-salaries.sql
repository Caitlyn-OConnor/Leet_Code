with cte as(
select 
    e.id
    ,e.name as Employee
    ,e.salary as Salary
    ,d.name as Department
    , dense_rank() over (
        partition by e.departmentid
        order by e.salary desc 
    ) as rank
from employee e
left join department d on e.departmentid = d.id
)

select 
    Department
    ,Employee
    ,Salary
from cte
where rank<4
    