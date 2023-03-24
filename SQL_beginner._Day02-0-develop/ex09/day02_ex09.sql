select name from (select person.name from person
join person_order on person.id = person_order.person_id
join menu on person_order.menu_id = menu.id and pizza_name = 'pepperoni pizza'

intersect

select person.name from person
join person_order on person.id = person_order.person_id
join menu on person_order.menu_id = menu.id and pizza_name = 'cheese pizza'
where person.gender = 'female') as new_table
order by name;