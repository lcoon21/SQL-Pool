with female_table as (select pizzeria.name as pizzeria_name from pizzeria
join person_visits on pizzeria.id = person_visits.pizzeria_id
join person on person_visits.person_id = person.id and person.gender = 'female'),

male_table as (select pizzeria.name as pizzeria_name from pizzeria
join person_visits on pizzeria.id = person_visits.pizzeria_id
join person on person_visits.person_id = person.id and person.gender = 'male')

select * from (select * from male_table except all select * from female_table) as temp1_table
union all
select * from (select * from female_table except all select * from male_table) as temp2_table
order by 1;