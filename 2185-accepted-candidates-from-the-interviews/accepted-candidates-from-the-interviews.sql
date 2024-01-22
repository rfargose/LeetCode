select candidate_id
from rounds r left join candidates c on r.interview_id = c.interview_id
where years_of_exp >= 2
group by candidate_id
having sum(score) > 15