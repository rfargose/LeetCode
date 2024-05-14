with cte1 as (SELECT
  REGEXP_SUBSTR(tweet, '#[A-Za-z0-9_]+') AS hashtag
FROM
  tweets)

select hashtag, count(hashtag) hashtag_count
from cte1
group by hashtag
order by hashtag_count desc, hashtag desc
limit 3
