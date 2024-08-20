with cte1 as (select concat(lat,',',lon) as location
from insurance 
group by lat, lon
having count(pid) > 1)

select round(sum(distinct i1.tiv_2016), 2) as tiv_2016
from insurance i1 inner join insurance i2 
on i1.tiv_2015 = i2.tiv_2015 and i1.pid != i2.pid
where concat(i1.lat,',',i1.lon) not in (select * from cte1)