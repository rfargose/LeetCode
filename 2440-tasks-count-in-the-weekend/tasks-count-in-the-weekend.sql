select sum(weekday(submit_date)>=5) weekend_cnt, sum(weekday(submit_date)<=4) working_cnt
from tasks
