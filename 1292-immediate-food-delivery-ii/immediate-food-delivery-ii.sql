with cte as(
select 
    customer_id
    ,case 
        when min(order_date)=min(customer_pref_delivery_date) then customer_id
        else null
        end as immediate_id
from delivery
group by customer_id
)

select 
   round((count(distinct cte.immediate_id) *1.0/ count(distinct delivery.customer_id))*100 ,2) as immediate_percentage
from delivery
left join cte on cte.immediate_id = delivery.customer_id