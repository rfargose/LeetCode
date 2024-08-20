select student_id, course_id, grade from(select *,
dense_rank() over(partition by student_id order by grade desc, course_id) as rk
from enrollments) sub
where rk = 1
order by 1