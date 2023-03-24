set enable_seqscan=off;

explain analyze select menu.pizza_name, pizzeria.name as pizzeria_name
from pizzeria
join menu on pizzeria.id = menu.pizzeria_id;