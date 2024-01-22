select order_id, customer_id, order_type
from (select *, dense_rank() over(partition by customer_id order by order_type) rk
from orders) sub
where sub.rk = 1