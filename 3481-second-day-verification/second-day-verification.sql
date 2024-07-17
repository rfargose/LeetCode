select e.user_id
from emails e
inner join texts t on
e.email_id = t.email_id
where date_add(date(e.signup_date), interval 1 day) = date(t.action_date)
and signup_action = 'Verified'
order by 1