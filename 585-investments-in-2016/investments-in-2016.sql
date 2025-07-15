with cte as (
    select 
        tiv_2015
        ,count(distinct pid) as cnt
    from insurance
    group by tiv_2015
),

cnt_cte as (
    select *
    from cte
    where cnt>1
),

cte2 as (
    select 
        lat
        ,lon
        ,count(distinct pid) cntll
    from insurance
    group by lat, lon
),

ll_cte as (
    select *
    from cte2
    where cntll=1
)

select 
    round(sum(tiv_2016),2) as tiv_2016
from insurance i
left join cnt_cte c on c.tiv_2015 = i.tiv_2015
left join ll_cte l on l.lat = i.lat and l.lon = i.lon
where c.tiv_2015 is not null and l.lat is not null and l.lon is not null