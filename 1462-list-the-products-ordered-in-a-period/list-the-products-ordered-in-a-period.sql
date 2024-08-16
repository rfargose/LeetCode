select p.product_name, sum(unit) unit
from orders o 
inner join products p on o.product_id = p.product_id
where date_format(order_date, '%Y-%m') = '2020-02'
group by 1
having sum(unit) >= 100