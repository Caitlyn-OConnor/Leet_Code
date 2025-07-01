with cte as(
    select *
    from employees
    where salary < 30000 and manager_id is not null
)

select cte.employee_id
from cte
left join employees e on e.employee_id = cte.manager_id
where e.employee_id is null
order by cte.employee_id