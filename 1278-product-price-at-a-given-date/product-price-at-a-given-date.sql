with cte1 as(select product_id, max(change_date) change_date from(
select * from products
where change_date < '2019-08-17'
order by product_id, change_date) s
group by 1),

cte2 as (select distinct product_id from products)

select c2.product_id,
case when c1.change_date is null then 10 else p.new_price end as price
from cte2 c2 left join cte1 c1 on c2.product_id = c1.product_id
left join products p on c1.product_id = p.product_id and c1.change_date = p.change_date