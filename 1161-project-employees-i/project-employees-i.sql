select 
    p.project_id
    , round(
        avg(
            cast(e.experience_years as decimal (10,2))
            ) 
        ,2) as average_years
from project p
inner join employee e
    on p.employee_id = e.employee_id
group by p.project_id