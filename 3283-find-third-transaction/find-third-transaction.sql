with cte1 as (select *, rank() over(partition by user_id order by transaction_date) rk
from transactions),

cte2 as (select *, 
case when rk = 3 and spend > lag(spend) over(partition by user_id order by transaction_date) 
and spend > lag(spend,2) over(partition by user_id order by transaction_date)
then 'Yes'
else 'No' end as c
from cte1)

select user_id, spend third_transaction_spend, transaction_date third_transaction_date
from cte2
where c = 'Yes'
order by 1