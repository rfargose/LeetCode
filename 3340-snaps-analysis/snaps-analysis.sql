select age_bucket, 
coalesce(round(sum(case when activity_type = 'send' then time_spent end) * 100/sum(time_spent), 2),0) send_perc,
coalesce(round(sum(case when activity_type = 'open' then time_spent end) * 100/sum(time_spent), 2), 0) open_perc
from activities act
join age 
using(user_id)
group by 1