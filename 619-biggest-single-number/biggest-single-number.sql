with cte1 as (select num, count(num) ct from myNumbers group by 1)

select max(num) num
from cte1 
where ct = 1