(select pizzeria.name, count(person_visits.pizzeria_id) as count, 'visit' as action_type from pizzeria
join person_visits on person_visits.pizzeria_id = pizzeria.id
group by pizzeria.name
limit 3)
union
(select pizzeria.name, count(person_order.menu_id) as count, 'order' as action_type from pizzeria
join menu on pizzeria.id = menu.pizzeria_id
join person_order on menu.id = person_order.menu_id
group by pizzeria.name
order by 3, 2 desc
limit 3)
order by 3, 2 desc;