/* Write your T-SQL query statement below */
select 
    w2.id Id
from weather w1
inner join weather w2
on w1.recordDate= dateadd(day,-1,w2.recordDate)
where w1.temperature<w2.temperature
