with cte1 as (
    select passenger_id, min(b.arrival_time) arrival_time
    from passengers p inner join buses b on p.arrival_time <= b.arrival_time
    group by 1
)

select bus_id, count(c.arrival_time) passengers_cnt 
from buses b left join cte1 c on b.arrival_time = c.arrival_time
group by 1
order by 1