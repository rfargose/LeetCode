with cte1 as (select *, datediff(created_at, lag(created_at) over(partition by user_id order by created_at)) daycount
from users)

select distinct user_id from cte1 where daycount <= 7