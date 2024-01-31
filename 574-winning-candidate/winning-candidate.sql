select name from (select c.name, count(c.name) max_vote
from vote v left join candidate c on v.candidateId = c.id
group by c.name
order by max_vote desc
limit 1) s