with cte as (
    select 
    requester_id
    , count(*) as cnt
    from requestaccepted
    group by requester_id
),

cte2 as (
    select
        accepter_id
        , count(*) as cnt2
    from requestaccepted
    group by accepter_id
),

cte_join as (
    select 
        case
        when cte.requester_id is not null then cte.requester_id 
        else cte2.accepter_id       
        end as id
        ,coalesce(cte.cnt,0) + coalesce(cte2.cnt2,0) as num
    from cte
    full join cte2 on cte2.accepter_id = cte.requester_id
)

select *
from cte_join
where num = (select max(num) from cte_join)
