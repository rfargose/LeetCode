with cte as (select user_id, purchase_date, 
datediff(purchase_date, lag(purchase_date) over(partition by user_id order by purchase_date)) diff
from purchases)

select distinct user_id from cte where diff <= 7