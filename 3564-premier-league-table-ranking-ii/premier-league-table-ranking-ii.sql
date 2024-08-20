with cte1 as (select team_name,
wins * 3 + draws * 1 as points,
rank() over(order by (wins * 3 + draws * 1) desc) position
from teamstats)

select team_name, points, position,
CASE
         WHEN position < (0.33 * (SELECT MAX(position) FROM cte1)+1) THEN 'Tier 1'
         ELSE
         CASE
            WHEN position < (0.66 * (SELECT MAX(position) FROM cte1)+1) THEN 'Tier 2'
            ELSE 'Tier 3'
         END
    END AS tier
from cte1
order by points desc, team_name