select name from pizzeria
where pizzeria.id not in (select person_visits.pizzeria_id from person_visits);

select name from pizzeria
where not exists (select 1 from person_visits where person_visits.pizzeria_id = pizzeria.id);