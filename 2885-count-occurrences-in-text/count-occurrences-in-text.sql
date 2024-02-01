with cte1 as (select 'bear' word, file_name
from files 
where content like '% bear %'
union all
select 'bull' word, file_name
from files 
where content like '% bull %')

select word, count(file_name) count from cte1 group by 1