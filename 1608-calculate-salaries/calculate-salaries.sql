with cte1 as (select company_id, max(salary) sal from salaries group by 1),
cte2 as (select s.*, c.sal from salaries s left join cte1 c on s.company_id = c.company_id)

select company_id, employee_id, employee_name,
case when sal < 1000 then salary
when sal >= 1000 and sal <= 10000 then round(salary - (24/100) * salary, 0)
when sal > 10000 then round(salary - (49/100) * salary, 0) end as salary
from cte2