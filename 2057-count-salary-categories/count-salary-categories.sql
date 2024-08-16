with cte1 as (select case when income < 20000 then 'Low Salary'
when income >= 20000 and income <= 50000 then 'Average Salary'
when income > 50000 then 'High Salary' end as category
from accounts),

cte2 as (select 'Low Salary' as category
union
select 'Average Salary' as category
union
select 'High Salary' as category),

cte3 as (select category, count(category) as ct from cte1 group by 1)

select c2.category, coalesce(c3.ct, 0) accounts_count
from cte2 c2 left join cte3 c3 on c2.category = c3.category