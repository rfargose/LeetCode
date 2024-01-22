with cte as (select *, row_number() over(partition by gender order by user_id) r1, 
case when gender = 'female' then 1
when gender = 'other' then 2
else 3 end as r2 
from genders)

select user_id, gender
from cte 
order by r1, r2