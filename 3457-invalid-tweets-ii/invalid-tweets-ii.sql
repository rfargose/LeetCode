with cte1 as(select tweet_id, length(content) len,
(length(content)-length(replace(content ,'@','')))/length('@') as c1,
(length(content)-length(replace(content ,'#','')))/length('#') as c2
from tweets)

select tweet_id from cte1
where len > 140
or c1 > 3
or c2 > 3