WITH CTE1 AS (select s.name
from orders o 
inner join SalesPerson s on o.sales_id = s.sales_id
inner join company c on o.com_id = c.com_id
where c.name = 'RED')

select name from salesperson
where name not in (select * from cte1)