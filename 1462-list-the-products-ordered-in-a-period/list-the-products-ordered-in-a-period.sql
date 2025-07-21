select 
    p.product_name
    ,sum(o.unit) as unit
from products p
inner join orders o on p.product_id = o.product_id
group by p.product_id , p.product_name, format(o.order_date, 'yyyy-MM')
having format(o.order_date, 'yyyy-MM')='2020-02' and sum(o.unit)>=100