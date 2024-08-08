select team_id, team_name, wins * 3 + draws * 1 as points,
rank() over (order by wins * 3 + draws * 1 desc) as position
from TeamStats
order by points desc, team_name

