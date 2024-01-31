with cte1 as (select *, 
datediff(steps_date, lag(steps_date) over(partition by user_id order by steps_date)) diff1,
datediff(lead(steps_date) over(partition by user_id order by steps_date), steps_date) diff2
from steps),

cte2 as (select user_id, steps_date, row_number() over(partition by user_id order by steps_date) rk,
round(avg(steps_count) over(partition by user_id order by steps_date rows between 2 preceding and current row),2) rolling_average
from cte1 where diff1 = 1 or diff2 = 1)

select user_id, steps_date, rolling_average
from cte2
where rk >= 3