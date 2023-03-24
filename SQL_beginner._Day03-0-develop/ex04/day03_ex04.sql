with female_table as (
select pizzeria.name
from pizzeria
join menu on pizzeria.id = menu.pizzeria_id
join person_order on menu.id = person_order.menu_id
join person on person_order.person_id = person.id and person.gender = 'female'),

male_table as (
select pizzeria.name
from pizzeria
join menu on pizzeria.id = menu.pizzeria_id
join person_order on menu.id = person_order.menu_id
join person on person_order.person_id = person.id and person.gender = 'male')

select * from (select * from female_table except select * from male_table) as temp1_table
union all
select * from (select * from male_table except select * from female_table) as temp2_table
order by 1;