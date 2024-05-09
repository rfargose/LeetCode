with cte1 as (select ca.*, co.first_name,
row_number() over(partition by type order by duration desc) rk
from calls ca left join contacts co on ca.contact_id = co.id)

select first_name, type, 
time_format(sec_to_time(duration), '%H:%i:%s') duration_formatted
from cte1
where rk < 4
order by type, duration desc, first_name desc