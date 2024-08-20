with cte1 as (select requester_id id from RequestAccepted
union all
select accepter_id id from RequestAccepted)

select id, count(id) num
from cte1
group by id
order by 2 desc
limit 1