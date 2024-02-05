with cte1 as (select *, case when drink is not null then 1 else 0 end as flag, 
row_number() over () r
from coffeeshop),
cte2 as (select *, sum(flag) over(order by r) s from cte1)

select id, first_value(drink) over (partition by s order by r) drink
from cte2