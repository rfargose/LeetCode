with cte1 as (
    select seat_id, seat_id - row_number() over(order by seat_id)  as diff
from cinema
where free = 1),

cte2 as (
    select diff, count(*) consecutive_seats_len, min(seat_id) first_seat_id, 
max(seat_id) last_seat_id, dense_rank() over(order by count(*) desc) rk
from cte1
group by diff)

select first_seat_id, last_seat_id, consecutive_seats_len
from cte2
where rk = 1
order by first_seat_id