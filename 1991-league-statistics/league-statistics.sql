with cte as ((select home_team_id team_id, count(*) matches_played, 
sum(case when home_team_goals > away_team_goals then 3
when home_team_goals = away_team_goals then 1
else 0 end) points, sum(home_team_goals) goal_for, sum(away_team_goals) goal_against, 
sum(home_team_goals) - sum(away_team_goals) goal_diff 
from matches
group by team_id)
union all
(select away_team_id team_id, count(*) matches_played, 
sum(case when home_team_goals < away_team_goals then 3
when home_team_goals = away_team_goals then 1
else 0 end) points, sum(away_team_goals) goal_for, sum(home_team_goals) goal_against, 
sum(away_team_goals) - sum(home_team_goals) goal_diff 
from matches
group by team_id))

select t.team_name, sum(matches_played) matches_played, sum(points) points, sum(goal_for) goal_for,
sum(goal_against) goal_against, sum(goal_diff) goal_diff
from cte c inner join teams t on c.team_id = t.team_id
group by c.team_id
order by points desc, goal_diff desc, team_name