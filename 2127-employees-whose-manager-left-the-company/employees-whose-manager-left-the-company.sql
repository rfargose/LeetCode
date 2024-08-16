select employee_id from employees 
where salary < 30000 and
manager_id not in (select distinct employee_id from employees)
order by 1