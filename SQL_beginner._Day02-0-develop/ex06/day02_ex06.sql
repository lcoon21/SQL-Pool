select menu.pizza_name as pizza_name, pizzeria.name as pizzeria_name from pizzeria
join menu on pizzeria.id = menu.pizzeria_id
join person_order on menu.id = person_order.menu_id
join person on person_order.person_id = person.id
where person.name = 'Denis' or person.name = 'Anna'
order by pizza_name, pizzeria_name;