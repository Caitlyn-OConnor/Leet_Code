select 
    e1.employee_id
    ,e1.name
    ,count(distinct e2.employee_id) as reports_count
    ,ROUND(AVG(e2.age*1.0), 0) AS average_age
from employees e1
inner join employees e2 on
    e1.employee_id = e2.reports_to
group by e1.employee_id, e1.name
order by e1.employee_id
