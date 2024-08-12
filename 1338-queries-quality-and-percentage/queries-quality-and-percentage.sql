with cte1 as (
    select query_name, count(*) poor_rating
    from queries where rating < 3
    group by 1)

select q.query_name, round(coalesce(avg(q.rating/q.position), 0), 2) quality, 
round(coalesce(c1.poor_rating/count(q.rating) * 100, 0), 2) poor_query_percentage
from queries q left join cte1 c1 on q.query_name = c1.query_name
where q.query_name is not null
group by 1