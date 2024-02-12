with cte1 as (select user_id, activity, min(activity_date) activity_date
from traffic 
where activity = 'login'
group by 1)

select activity_date login_date, count(user_id) user_count
from cte1
where datediff ('2019-06-30', activity_date) <= 90
group by 1