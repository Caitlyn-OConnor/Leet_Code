select 
    contest_id
    , round(
    (cast(count(user_id) as decimal(10,2))
        / 
        (select cast(count(user_id) as decimal(10,2))
        from users )
    )*100 
    ,2)
         as percentage

from register
group by contest_id
order by percentage desc, contest_id asc
