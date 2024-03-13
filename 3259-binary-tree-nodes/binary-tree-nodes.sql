with cte as (select distinct P from Tree where P is not null)

select N, 
case when P is null then 'Root'
when N not in (select * from cte) then 'Leaf'
else 'Inner' end as Type
from tree
order by N