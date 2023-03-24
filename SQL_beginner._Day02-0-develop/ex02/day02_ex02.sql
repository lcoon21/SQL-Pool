select coalesce(person.name, '-') as person_name, 
person_visits.visit_date as visit_date, 
coalesce(pizzeria.name, '-') as pizzeria_name
from person
left join person_visits on person.id = person_visits.person_id AND
person_visits.visit_date BETWEEN '2022-01-01' and '2022-01-03'
full join pizzeria on person_visits.pizzeria_id = pizzeria.id
order by person_name, visit_date, pizzeria_name;
