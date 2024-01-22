with cte1 as (select s.*, dense_rank() over(partition by user_id order by total_amount desc) rk
from (select s.user_id, s.product_id, sum(quantity * price) as total_amount
from sales s left join product p on s.product_id = p.product_id
group by s.user_id, s.product_id) s)

select user_id, product_id from cte1 where rk = 1