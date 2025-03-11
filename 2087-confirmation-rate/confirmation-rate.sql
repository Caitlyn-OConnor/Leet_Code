   
   with c as(
    SELECT 
        user_id
        , [confirmed]
        , [timeout]
      , cast([confirmed]+[timeout] as decimal(10,2)) as con_and_timeout
    FROM (
    SELECT user_id, action,time_stamp
    FROM confirmations
    ) as SourceTable
    PIVOT (
    COUNT(time_stamp) 
    FOR action IN ([confirmed], [timeout])
    ) AS PivotTable

    
    )

select 
    s.user_id
    ,round(coalesce(c.confirmed/c.con_and_timeout,0),2) as confirmation_rate
   from Signups s
   left join c 
    on s.user_id = c.user_id


