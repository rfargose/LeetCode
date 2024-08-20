select name customers from customers
where id not in (select distinct customerid from orders)