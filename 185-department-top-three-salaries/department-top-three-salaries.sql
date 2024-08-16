with cte1 as (select d.name Department, e.name Employee, e.salary Salary, 
dense_rank() over(partition by e.departmentId order by salary desc) as rk
from employee e 
inner join department d on e.departmentId = d.id)

select Department, Employee, Salary
from cte1
where rk < 4