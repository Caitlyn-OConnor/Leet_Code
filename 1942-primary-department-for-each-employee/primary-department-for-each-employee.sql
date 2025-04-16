with cte as (
select 
    employee_id
    ,count(distinct department_id) as cnt_dep
from employee
group by employee_id
)

select
    employee.employee_id
    ,case 
        when cte.cnt_dep=1 and employee.primary_flag='N' then max(employee.department_id)
        when cte.cnt_dep>1 and employee.primary_flag='Y' then max(employee.department_id)
        end as department_id
from employee
left join cte on 
    employee.employee_id = cte.employee_id

group by employee.employee_id, cte.cnt_dep, employee.primary_flag

having case 
        when cte.cnt_dep=1 and employee.primary_flag='N' then max(employee.department_id)
        when cte.cnt_dep>1 and employee.primary_flag='Y' then max(employee.department_id)
        end is not null