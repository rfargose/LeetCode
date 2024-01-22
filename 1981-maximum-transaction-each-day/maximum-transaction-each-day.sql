select s.transaction_id
from (select *, rank() over(partition by day order by amount desc) amt_rank from transactions) s
where s.amt_rank = 1
order by transaction_id