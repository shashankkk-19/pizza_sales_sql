-- Identify the most common pizza size ordered.
with cte as (
select pizzas.pizza_id ,pizzas.size, order_details.quantity
from pizzas join order_details
on pizzas.pizza_id = order_details.pizza_id
)
select size,sum(quantity) from cte group by size order by sum(quantity) desc limit 1;