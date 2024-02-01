with cte1 as (select *, hour(call_time) peak_calling_hour, count(hour(call_time)) number_of_calls
from calls
group by city, peak_calling_hour),
    
cte2 as (select *, rank() over(partition by city order by number_of_calls desc) rk
from cte1)

select city, peak_calling_hour, number_of_calls  
from cte2 where rk = 1
order by peak_calling_hour desc, city desc