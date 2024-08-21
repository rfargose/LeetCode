with cte1 as (select e.*,
case when operator = '=' then v.value = v1.value 
when operator = '<' then v.value < v1.value
when operator = '>' then v.value > v1.value
end as value
from expressions e 
inner join variables v on e.left_operand = v.name
inner join variables v1 on e.right_operand = v1.name)

select left_operand, operator, right_operand,
case when value = 1 then 'true' else 'false' end as value
from cte1