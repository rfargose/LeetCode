with cte1 as (select question_id, coalesce(sum(action = 'answer')/sum(action = 'show'),0) answer_rate
from surveylog
group by 1),

cte2 as (select *, dense_rank() over(order by answer_rate desc, question_id) rk
from cte1)

select question_id survey_log from cte2 where rk = 1