select case when a + b > c and b + c > a and a + c > b then 
case when a = b and b = c and c = a then 'Equilateral' 
when a != b and b != c and c != a then 'Scalene'
else 'Isosceles'
end
else 'Not A Triangle' end as triangle_type
from triangles