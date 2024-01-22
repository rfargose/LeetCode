with cte1 as (select player_id, player_name, wimbledon win from championships
join players on wimbledon = player_id
union all
select player_id, player_name, fr_open win from championships
join players on fr_open = player_id
union all
select player_id, player_name, us_open win from championships
join players on us_open = player_id
union all
select player_id, player_name, au_open win from championships
join players on au_open = player_id)

select player_id, player_name, count(win) grand_slams_count from cte1
group by 1