with cte1 as (select o.order_id, o.order_date, o.customer_id, c.name, o.product_id, p.product_name, count(order_id) total_products
from orders o inner join customers c on c.customer_id = o.customer_id
inner join products p on o.product_id = p.product_id
group by o.customer_id, o.product_id),
cte2 as (select *, dense_rank() over(partition by customer_id order by total_products desc) prd_rank from cte1)

select customer_id, product_id, product_name from cte2
where prd_rank = 1