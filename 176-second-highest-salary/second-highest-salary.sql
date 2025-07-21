with cte as(
select 
    salary
    ,dense_rank() over(order by salary desc)  as rk
from employee
)

select 
    max(salary) as SecondHighestSalary
from cte
where rk=2
