insert into menu VALUES
((select max(id) from menu) + 1, (select pizzeria.id from pizzeria
where pizzeria.name = 'Dominos'), 'sicilian pizza', 900);