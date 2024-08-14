with first_date as (select customer_id, min(order_date) first_order from delivery group by 1),

order_pref as (
    select *, 
    case when order_date = customer_pref_delivery_date 
    then 'immediate' else 'scheduled' end as delivery_pref
    from delivery
)

select round(sum(delivery_pref='immediate')/count(delivery_pref)*100,2) as immediate_percentage
from order_pref p
inner join first_date f 
on p.customer_id = f.customer_id and p.order_date = f.first_order
