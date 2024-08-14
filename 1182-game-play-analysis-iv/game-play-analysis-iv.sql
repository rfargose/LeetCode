select round(count(a2.player_id)/count(a1.player_id), 2) fraction
from (select player_id, min(event_date) d from activity group by 1) a1
left join activity a2 on a1.player_id = a2.player_id and a1.d = date_sub(a2.event_date, interval 1 day)