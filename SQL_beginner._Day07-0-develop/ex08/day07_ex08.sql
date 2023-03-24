select address, pizzeria.name, count(person_order.menu_id) from person
join person_order on person.id = person_order.person_id
join menu on person_order.menu_id = menu.id
join pizzeria on menu.pizzeria_id = pizzeria.id
group by address, pizzeria.name
order by 1, 2;