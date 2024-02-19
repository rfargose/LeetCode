with cte2 as (select date_format(c.trans_date, '%Y-%m') month, t.country, count(c.trans_id) chargeback_count, 
sum(t.amount) chargeback_amount 
from chargebacks c left join transactions t on c.trans_id = t.id 
group by 1, 2),

cte3 as (select date_format(trans_date, '%Y-%m') month, country, count(state) approved_count, 
sum(amount) approved_amount
from transactions
where state = 'approved'
group by 1, 2),

cte1 as (select month, country from cte2
union 
select month, country from cte3)

select  c1.month, 
c1.country,
coalesce(c3.approved_count,0) approved_count, 
coalesce(c3.approved_amount,0) approved_amount, 
coalesce(c2.chargeback_count,0) chargeback_count, 
coalesce(c2.chargeback_amount,0) chargeback_amount
from cte1 c1 left join cte3 c3 on c1.month = c3.month and c1.country = c3.country
left join cte2 c2 on c1.month = c2.month and c1.country = c2.country 