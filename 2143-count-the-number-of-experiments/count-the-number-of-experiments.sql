with cte1 as (select platform, experiment_name, count(experiment_name) num_experiments 
from experiments
group by platform, experiment_name),

cte2 as (select 'Android' platform union all 
select 'IOS' platform
union all 
select 'Web' platform),

cte3 as (select 'Reading' experiment_name union all 
select 'Sports' experiment_name
union all 
select 'Programming' experiment_name)

select c2.platform, c3.experiment_name, coalesce(c1.num_experiments, 0) num_experiments
from cte2 c2 join cte3 c3
left join cte1 c1 on c2.platform = c1.platform and c3.experiment_name = c1.experiment_name