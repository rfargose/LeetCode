with recursive cte1 as (
    select employee_id, employee_name, manager_id,
    1 as level
    from employees
    where manager_id = 1 and employee_id != 1
    union all
    select e.employee_id, e.employee_name, e.manager_id,
    level + 1 as level
    from employees e
    inner join cte1 c1 on e.manager_id = c1.employee_id
)

select employee_id from cte1