with cte1 as (select * from (select *, lead(price) over(partition by stock_name order by stock_name, operation_day) - price   diff 
from stocks
order by stock_name, operation_day) sub
where sub.operation = 'Buy')

select stock_name, sum(diff) capital_gain_loss from cte1
group by 1