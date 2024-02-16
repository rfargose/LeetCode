with cte1 as (select book_id, sum(quantity) quantity from orders
where dispatch_date between '2018-06-23' and '2019-06-23' group by 1),

cte2 as (select b.book_id, b.name, coalesce(c1.quantity,0) book_count
from books b left join cte1 c1 on b.book_id = c1.book_id
where available_from <= '2019-05-23')

select book_id, name from cte2 where book_count < 10