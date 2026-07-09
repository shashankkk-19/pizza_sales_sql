-- Group the orders by date and calculate the average number of pizzas ordered per day.
with cte as(
select orders.order_date, sum(quantity) as average
from orders join order_details
on orders.order_id = order_details.order_id
group by orders.order_date
)
select avg(average) from cte;
