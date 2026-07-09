-- Calculate the percentage contribution of each pizza type to total revenue.
with cte as(
select pizza_types.category, sum(order_details.quantity * pizzas.price) as revenue
from pizzas join pizza_types
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details 
on pizzas.pizza_id = order_details.pizza_id
group by pizza_types.category )
select category,round((revenue/(select sum(revenue) from cte))*100,2) as revp from cte
group by category;

