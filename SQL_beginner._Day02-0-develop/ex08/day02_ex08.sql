select person.name from person
join person_order on person.id = person_order.person_id
and (person.address = 'Moscow' or person.address = 'Samara')
join menu on person_order.menu_id = menu.id
and (menu.pizza_name = 'pepperoni pizza' or menu.pizza_name = 'mushroom pizza')
where person.gender = 'male'
order by name DESC;