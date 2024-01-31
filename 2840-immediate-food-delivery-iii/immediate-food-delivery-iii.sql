with cte1 as (select *, 
case when order_date = customer_pref_delivery_date then 1 else 0 end as delivery
from delivery)

select order_date, round(sum(delivery)/count(order_date)*100,2) immediate_percentage 
from cte1 
group by order_date
order by order_date