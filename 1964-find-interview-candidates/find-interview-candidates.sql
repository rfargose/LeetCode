with cte1 as (select *, row_number() over(partition by medal order by contest_id) rk from
(select contest_id, gold_medal as medal from contests
union all
select contest_id, silver_medal as medal from contests
union all
select contest_id, bronze_medal as medal from contests) sub),

cte2 as (select medal from cte1
group by medal, contest_id - rk
having count(medal) >= 3
union
select gold_medal as medal from contests
group by gold_medal
having count(gold_medal) >= 3)

select name, mail from cte2 c2 inner join users u on c2.medal = u.user_id 