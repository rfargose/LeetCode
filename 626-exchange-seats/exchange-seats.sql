with cte1 as (select *,
lead(id, 1) over(order by id) as next,
lag(id, 1) over(order by id) as prev
from seat)

select
case  when id % 2 = 1 and next is not null then next
when id % 2 = 0 then prev
else id end as id, student
from cte1
order by 1