select state, group_concat(distinct city order by city separator ', ') cities
from cities
group by state