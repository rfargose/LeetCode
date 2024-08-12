with cte1 as (
    select student_id, subject_name, count(*) attended_exams
    from examinations
    group by student_id, subject_name
)

select s.*, su.*, coalesce(attended_exams, 0) attended_exams
from students s join subjects su
left join cte1 c1 on s.student_id = c1.student_id
and su.subject_name = c1.subject_name
order by s.student_id, su.subject_name