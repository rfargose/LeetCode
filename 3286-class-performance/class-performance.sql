with cte1 as (select student_id, (assignment1 + assignment2 + assignment3) as total_score from scores)

select (select max(total_score) from cte1) - (select min(total_score) from cte1) difference_in_score from cte1 limit 1