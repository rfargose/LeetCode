select left_operand, operator, right_operand,
case when v1.value > v2.value and operator = '>' then 'true'
when v1.value< v2.value and operator = '<' then 'true'
when v1.value = v2.value and operator = '=' then 'true'
else 'false' end value
from expressions e
left join variables v1 on e.left_operand = v1.name
left join variables v2 on e.right_operand = v2.name