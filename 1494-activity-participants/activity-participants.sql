with cte1 as (select activity, count(activity) a1
from friends
group by 1),
cte2 as ((select activity from cte1
where a1 in (select min(a1) from cte1))
union all
(select activity from cte1
where a1 in (select max(a1) from cte1)))

select name activity from Activities where name not in (select activity from cte2)