select query_name, round(avg(rating/position), 2) quality,
round(sum(case when rating < 3 then 1 else 0 end)/count(rating) * 100, 2) poor_query_percentage
from queries
where query_name is not null
group by 1