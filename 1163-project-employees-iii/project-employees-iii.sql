with cte1 as (select p.project_id, e.*, dense_rank() over(partition by project_id order by experience_years desc) exp_rank
from project p 
left join employee e on p.employee_id = e.employee_id)

select project_id, employee_id from cte1 where exp_rank = 1