with cte1 as(select first_col, row_number() over(order by first_col) rk
from data),

cte2 as (select second_col, row_number() over(order by second_col desc) rk
from data)

select first_col, second_col from cte1 c1 inner join cte2 c2 on c1.rk = c2.rk