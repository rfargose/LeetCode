with cte1 as (select mr.user_id, count(mr.rating) as total_reviews, u.name as results
from movierating mr
inner join users u on mr.user_id = u.user_id
group by 1
order by total_reviews desc, u.name),

cte2 as (select mr.movie_id, avg(mr.rating) avg_rating, m.title results
from movierating mr
inner join movies m on mr.movie_id = m.movie_id
where date_format(created_at, '%Y-%m') = '2020-02'
group by 1
order  by 2 desc, 3)

(select results from cte1 limit 1)
union all
(select results from cte2 limit 1)