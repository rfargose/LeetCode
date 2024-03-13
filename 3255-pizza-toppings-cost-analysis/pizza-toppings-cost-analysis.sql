select concat(t1.topping_name, ',' , t2.topping_name, ',', t3.topping_name) pizza,
t1.cost + t2.cost + t3.cost total_cost
from toppings t1 join toppings t2 on t1.topping_name < t2.topping_name
join toppings t3 on t2.topping_name < t3.topping_name
order by total_cost desc, pizza