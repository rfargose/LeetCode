with cte1 as (select user_id, sum(amount) tran from (select paid_by user_id, -amount as amount from transactions
union all 
select paid_to user_id, amount as amount from transactions) sub 
group by 1)

select *, case when credit < 0 then 'Yes' else 'No' end as credit_limit_breached
from (select u.user_id, u.user_name, u.credit + coalesce(c.tran,0) as credit
from users u left join cte1 c on u.user_id = c.user_id) s