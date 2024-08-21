with cte1 as (select fail_date task_date, 'failed' as period_state
from failed
where year(fail_date) = '2019'
union all
select success_date, 'succeeded' as period_state
from succeeded
where year(success_date) = '2019'),

cte2 as (select *,
row_number() over(partition by period_state order by task_date) rk
from cte1),

cte3 as (select task_date, period_state, date_sub(task_date, interval rk day) grp
from cte2)

select period_state, min(task_date) start_date, max(task_date) end_date
from cte3
group by grp, period_state
order by 2