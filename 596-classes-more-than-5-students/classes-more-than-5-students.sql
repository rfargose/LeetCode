select class
from courses
group by 1
having count(class) >= 5