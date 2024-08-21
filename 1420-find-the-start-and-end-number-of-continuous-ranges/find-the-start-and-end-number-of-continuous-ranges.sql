with cte1 as (select log_id, log_id - row_number() over(order by log_id) as diff
from logs)

select min(log_id) start_id, max(log_id) end_id
from cte1
group by diff
order by 1