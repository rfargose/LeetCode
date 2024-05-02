with cte1 as (select t.*, c.banned c_banned, d.banned b_banned from trips t
inner join users c on t.client_id = c.users_id 
inner join users d on t.driver_id = d.users_id
where c.banned = 'No' and d.banned = 'No'
and request_at between '2013-10-01' and '2013-10-03')

select request_at Day, round(sum(status != 'completed')/count(*), 2) `Cancellation Rate`
from cte1
group by 1