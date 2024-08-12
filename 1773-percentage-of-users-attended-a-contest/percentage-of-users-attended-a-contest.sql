select contest_id, 
round(count(user_id)/ (select count(*) from users) * 100, 2) percentage
from register
group by 1
order by 2 desc, 1