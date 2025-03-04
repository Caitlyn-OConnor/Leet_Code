/* Write your T-SQL query statement below */
select 
    customer_id, 
    count(*) count_no_trans
from visits v
left join transactions t
    on t.visit_id = v.visit_id
where t.transaction_id is null
group by customer_id