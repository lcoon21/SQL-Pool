select * from (select pizzeria.name as pizzeria_name from pizzeria
join person_visits on pizzeria.id = person_visits.pizzeria_id
join person on person_visits.person_id = person.id and person.name = 'Andrey') as temp1_table
except all
select * from (select pizzeria.name as pizzeria_name from pizzeria
join menu on pizzeria.id = menu.pizzeria_id
join person_order on menu.id = person_order.menu_id
join person on person_order.person_id = person.id and person.name = 'Andrey') as temp2_table
order by 1;
