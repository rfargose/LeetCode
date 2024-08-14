with cte1 as (
    select product_id, min(year) first_year from sales group by 1
)

select c1.product_id, c1.first_year, s.quantity, s.price 
from cte1 c1
inner join sales s 
on c1.product_id = s.product_id  and c1.first_year = s.year