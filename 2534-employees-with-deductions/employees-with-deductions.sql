with cte1 as (select employee_id, 
sum(ceil(timestampdiff(second, in_time, out_time)/60)) mins 
from logs group by employee_id),

cte2 as (select e.employee_id, e.needed_hours * 60 as needed_mins, coalesce(c.mins, 0) mins
from employees e left join cte1 c on e.employee_id = c.employee_id)

select distinct employee_id from cte2 where needed_mins > mins