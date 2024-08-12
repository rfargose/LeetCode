select date_format(trans_date, '%Y-%m') month, country, count(id) trans_count,
sum(state = 'approved') approved_count, sum(amount) trans_total_amount,
sum(case when state = 'approved' then amount else 0 end) approved_total_amount
from transactions
group by 1, 2