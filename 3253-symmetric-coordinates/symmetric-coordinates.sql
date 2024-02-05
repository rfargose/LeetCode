with cte as (select *, row_number() over() as rw from coordinates)

select distinct c1.x, c1.y
from cte c1 join cte c2
where c1.x = c2.y and c2.x = c1.y and c1.x <= c1.y and c1.rw != c2.rw
order by x, y
