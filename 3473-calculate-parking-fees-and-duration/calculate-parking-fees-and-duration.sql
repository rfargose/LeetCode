with cte1 as (select lot_id, car_id, 
timestampdiff(second, entry_time, exit_time)/3600 as hr, fee_paid
from ParkingTransactions
order by 2),

cte2 as (select lot_id, car_id, sum(fee_paid) total_fee_lot, sum(hr) total_hr_lot,
dense_rank() over(partition by car_id order by sum(hr) desc) rk
from cte1
group by lot_id, car_id)

select car_id, sum(total_fee_lot) total_fee_paid, 
round(sum(total_fee_lot)/sum(total_hr_lot),2) avg_hourly_fee, 
sum(case when rk = 1 then lot_id else 0 end) most_time_lot
from cte2
group by 1
order by 1