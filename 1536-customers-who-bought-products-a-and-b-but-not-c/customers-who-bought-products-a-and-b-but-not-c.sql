with cte1 as (select c.customer_id, c.customer_name,
group_concat(distinct product_name order by product_name) products_bought
from customers c
inner join orders o on c.customer_id = o.customer_id
group by 1)

select customer_id, customer_name
from cte1 where products_bought like '%A%' and products_bought like '%B%' 
and products_bought not like '%C%'