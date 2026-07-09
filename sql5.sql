-- List the top 5 most ordered pizza types along with their quantities.
with cte as (
select pizzas.pizza_id,pizza_types.name 
from pizzas join pizza_types
on pizzas.pizza_type_id = pizza_types.pizza_type_id
)
select  cte.name,sum(order_details.quantity) as coun
from cte join order_details
on cte.pizza_id = order_details.pizza_id
group by cte.name 
order by coun desc limit 5;