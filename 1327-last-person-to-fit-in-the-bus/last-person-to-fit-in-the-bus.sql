with cte1 as (select person_name, sum(weight) over(order by turn) cum_weight
from queue)

select person_name from cte1
where cum_weight <= 1000
order by cum_weight desc
limit 1