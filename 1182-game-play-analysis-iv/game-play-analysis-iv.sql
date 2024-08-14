with cte1 as(
    select player_id, min(event_date) first_date
    from activity
    group by 1
),

cte2 as (
    select player_id, first_date, date_add(first_date, interval 1 day) next_day
    from cte1
)

select
round((select count(distinct player_id) 
from activity
where (player_id, event_date) 
in (select player_id, next_day from cte2))/count(distinct player_id),2)
as fraction
from activity