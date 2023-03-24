with pizzeria1 as (select menu.pizza_name as pizza_name,
pizzeria.name as pizzeria_name_1, menu.price, pizzeria.id from menu
join pizzeria on menu.pizzeria_id = pizzeria.id),

pizzeria2 as (select menu.pizza_name as pizza_name,
pizzeria.name as pizzeria_name_2, menu.price, pizzeria.id from menu
join pizzeria on menu.pizzeria_id = pizzeria.id)

select pizzeria1.pizza_name, pizzeria1.pizzeria_name_1, pizzeria2.pizzeria_name_2, pizzeria1.price
from pizzeria1
join pizzeria2 on pizzeria1.pizza_name = pizzeria2.pizza_name and
pizzeria1.price = pizzeria2.price and pizzeria1.pizzeria_name_1 <> pizzeria2.pizzeria_name_2
and pizzeria1.pizza_name = pizzeria2.pizza_name and pizzeria1.id > pizzeria2.id
order by 1;

