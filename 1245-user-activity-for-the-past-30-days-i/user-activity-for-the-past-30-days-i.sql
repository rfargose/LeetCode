select activity_date day, count(distinct user_id) active_users
from activity
where activity_date between date_add('2019-07-27', interval -29 day) and '2019-07-27'
group by 1