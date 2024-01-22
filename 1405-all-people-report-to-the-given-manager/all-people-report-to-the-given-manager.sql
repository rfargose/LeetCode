with recursive cte as (
    select employee_id, employee_name, manager_id, 1 as level from employees
    WHERE manager_id = 1 AND employee_id <> 1
    union all
    select e.employee_id, e.employee_name, e.manager_id, level + 1 as level
    from employees e inner join cte c
    on e.manager_id = c.employee_id
)

select employee_id from cte