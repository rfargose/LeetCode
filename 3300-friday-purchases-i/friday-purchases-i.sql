with cte1 as (select *, weekday(purchase_date) wk_day, CASE 
WHEN extract(day from purchase_date) < 8 THEN 1
WHEN extract(day from purchase_date) < 15 THEN 2
WHEN extract(day from purchase_date) < 22 THEN 3
ELSE 4
END AS week_of_month
from purchases)

select week_of_month, purchase_date, sum(amount_spend) total_amount 
from cte1 where wk_day = 4
group by purchase_date 
order by week_of_month 