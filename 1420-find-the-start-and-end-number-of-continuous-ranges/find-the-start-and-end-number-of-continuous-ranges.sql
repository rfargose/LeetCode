with cte1 as (select log_id, row_number() over(order by log_id) r from logs)

select min(log_id) start_id, max(log_id) end_id
from cte1
group by (log_id - r)
order by 1