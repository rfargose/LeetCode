with cte as (select candidate_id, group_concat(skill order by skill) as skills
from candidates
group by 1)

select candidate_id from cte 
where skills like '%PostgreSQL%' and skills like '%Tableau%' and skills like '%Python%'
order by 1