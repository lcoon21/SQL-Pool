select (select name from person where person.id = pv.person_id) as person_name,
		(select name from pizzeria where pizzeria.id = pv.pizzeria_id) as pizzeria_name
from (select person_id,pizzeria_id,visit_date from person_visits) as pv
where visit_date between '01-07-2022' and '01-09-2022'
order by person_name asc, pizzeria_name desc;