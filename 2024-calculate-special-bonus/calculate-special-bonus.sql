select employee_id,
case when left(name, 1) != 'M' and mod(employee_id, 2) = 1 then salary 
else 0 end as bonus
from employees
order by 1