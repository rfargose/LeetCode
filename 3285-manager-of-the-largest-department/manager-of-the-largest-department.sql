with cte1 as (select dep_id, count(dep_id) emp_ct from employees group by dep_id)

select manager_name, dep_id from (select emp_name manager_name, e.dep_id, emp_ct, dense_rank() over(order by emp_ct desc) rk
from employees e inner join cte1 c on e.dep_id = c.dep_id 
where e.position = 'Manager') s
where s.rk = 1
order by dep_id