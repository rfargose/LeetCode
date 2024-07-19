with recursive cte1 as (
    select 1 as week_of_month
    union
    select week_of_month + 1
    from cte1
    where week_of_month < 4
),

cte2 as (select 'Premium' as membership
union 
select 'VIP'),

cte3 as (select purchase_date, ceil(DAYOFMONTH(purchase_date)/7) AS week_of_month,
membership, amount_spend
from purchases p inner join users u on p.user_id = u.user_id
where dayofweek(purchase_date) = 6 and membership != 'Standard')

select c1.week_of_month, c2.membership, coalesce(sum(c3.amount_spend),0) total_amount
from cte1 c1 join cte2 c2
left join cte3 c3 using (week_of_month, membership)
group by 1,2
order by 1,2