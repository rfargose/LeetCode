with cte1 as (select visited_on, sum(amount) amount
from customer
group by 1),

cte2 as (select visited_on,
sum(amount) over(order by visited_on rows between 6 preceding and current row) amount,
round((avg(amount) over(order by visited_on rows between 6 preceding and current row)), 2) average_amount
from cte1)

select * from cte2
where visited_on >= (select min(visited_on) from customer) + 6