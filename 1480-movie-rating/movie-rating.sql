with cte as(
select 
    mr.*
    ,m.title
    ,u.name
from movierating mr
left join users u on u.user_id = mr.user_id
left join movies m on m.movie_id = mr.movie_id
),

usercte as(
select 
    name
    ,user_id
    ,count(distinct movie_id) as no_ratings
    ,rank() over (order by count(distinct movie_id) desc, name asc) as rank
from cte
group by name, user_id
),

filmcte as(
    select 
    title
    ,rank() over (order by avg(cast(rating as decimal(3,2))) desc, title asc) as rank
from cte
where month(created_at) = 2 and year(created_at)=2020
group by title
)

select 
    f.title as results
from filmcte f
where f.rank = 1 
union all
select 
    u.name as results
from usercte u
where u.rank = 1