with recursive cte1 as(
    select 1 as customer_id from customers
    union all
    select customer_id + 1 from cte1 where customer_id + 1 <= (select max(customer_id) from customers)
)

SELECT distinct customer_id ids FROM cte1 
where customer_id not in (select customer_id from customers)
