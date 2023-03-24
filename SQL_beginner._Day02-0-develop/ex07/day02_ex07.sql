select pizzeria.name as pizzeria_name from pizzeria
join person_visits on pizzeria.id = person_visits.pizzeria_id and visit_date = '2022-01-08'
join person on person_visits.person_id = person.id and person.name = 'Dmitriy'
join menu on pizzeria.id = menu.pizzeria_id
where menu.price < 800;