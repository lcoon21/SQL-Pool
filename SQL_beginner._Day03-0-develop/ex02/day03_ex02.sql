with temp_table as 
(select menu.id as menu_id from menu
except
select person_order.menu_id from person_order
order by menu_id)

select menu.pizza_name, menu.price, pizzeria.name as pizzeria_name
from menu
join pizzeria on menu.pizzeria_id = pizzeria.id
join temp_table on menu.id = temp_table.menu_id
order by pizza_name, price;