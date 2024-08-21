with cte1 as (select e.*, v.value v1, v1.value v2 
from expressions e 
inner join variables v on e.left_operand = v.name
inner join variables v1 on e.right_operand = v1.name),

cte2 as (select c1.*,
case when operator = '=' then v1 = v2 
when operator = '<' then v1 < v2
when operator = '>' then v1 > v2
end as value
from cte1 c1)

select left_operand, operator, right_operand,
case when value = 1 then 'true' else 'false' end as value
from cte2