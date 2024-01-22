with cte1 as(select customer_id, GROUP_CONCAT(product_name order by product_name) products
from orders
group by 1),
cte2 as(select customer_id from cte1 where products like 'A%' and products like '%B%' and products not like '%C%')

select cte2.customer_id, customers.customer_name from cte2 inner join customers on cte2.customer_id = customers.customer_id
