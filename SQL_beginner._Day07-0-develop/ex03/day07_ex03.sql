select temp_table.name, sum(temp_table.total_count) as total_count from
((select pizzeria.name, count(person_visits.pizzeria_id) as total_count from pizzeria
join person_visits on person_visits.pizzeria_id = pizzeria.id
group by 1)
union all
(select pizzeria.name, count(person_order.menu_id) as total_count from pizzeria
join menu on pizzeria.id = menu.pizzeria_id
join person_order on menu.id = person_order.menu_id
group by 1
order by 2 desc, 1)) as temp_table
group by 1
order by 2 desc, 1;
