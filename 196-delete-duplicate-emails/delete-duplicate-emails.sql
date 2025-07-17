DELETE FROM person
WHERE id not in (
select 
    min(id) as id
from person
group by email)
