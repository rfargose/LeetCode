with cte1 as (
    select account_id, 
    sum(amount) amt,
    date_format(day, '%Y%m') tday
    from transactions
    where type = 'Creditor'
    group by account_id, date_format(day, '%Y%m')
    order by account_id, date_format(day, '%Y%m')
), 
cte2 as (select c.account_id, tday, amt, max_income,
lead(tday) over(partition by account_id order by tday) nday
from cte1 c
left join accounts a on c.account_id = a.account_id
where amt > max_income)

select distinct account_id
from cte2
where nday - tday = 1

