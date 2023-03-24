select menu.pizza_name as pizza_name, pizzeria.name as pizzeria_name, menu.price from pizzeria
join menu on menu.pizzeria_id = pizzeria.id 
where menu.pizza_name = 'mushroom pizza' or menu.pizza_name = 'pepperoni pizza'
order by pizza_name, pizzeria_name;