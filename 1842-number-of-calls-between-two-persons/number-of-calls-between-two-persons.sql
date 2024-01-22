with cte1 as (select *,
concat(least(from_id, to_id),'-', greatest(from_id, to_id)) calls
from calls)

select least(from_id, to_id) person1, greatest(from_id, to_id) person2, count(calls) call_count, sum(duration) total_duration
from cte1
group by calls