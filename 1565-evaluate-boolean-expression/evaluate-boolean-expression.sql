select e.*,
case when operator = '=' and v.value = v1.value then 'true'
when operator = '<' and v.value < v1.value then 'true'
when operator = '>' and v.value > v1.value then 'true'
else 'false'
end as value
from expressions e 
inner join variables v on e.left_operand = v.name
inner join variables v1 on e.right_operand = v1.name