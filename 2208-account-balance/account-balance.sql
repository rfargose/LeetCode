with cte1 as (select account_id, day, case when type = 'Deposit' then amount else 0 - amount end as amount
from transactions
order by account_id, day)

select account_id, day, sum(amount) over(partition by account_id order by day) balance
from cte1