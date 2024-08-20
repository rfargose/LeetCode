with cte1 as (select distinct seller_id
from orders
where year(sale_date) = '2020')

select seller_name from seller
where seller_id not in (select * from cte1)
order by 1


