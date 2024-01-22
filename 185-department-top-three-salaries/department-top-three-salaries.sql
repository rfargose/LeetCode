with cte1 as (
  select d.name Department, e.name Employee, e.salary Salary, dense_rank() over(partition by departmentId order by salary desc) r
  from employee e
  left join department d
  on e.departmentId = d.id
)

select Department, Employee, Salary from cte1
where r <= 3