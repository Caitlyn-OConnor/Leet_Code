select 
    p.product_name
    ,sum(o.unit) as unit
from products p
inner join orders o on p.product_id = o.product_id
group by p.product_id , p.product_name, year(o.order_date), month(o.order_date)
having year(o.order_date)='2020' and month(o.order_date)='02' and sum(o.unit)>=100