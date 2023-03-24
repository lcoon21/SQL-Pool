refresh materialized view mv_dmitriy_visits_and_eats;
insert into person_visits values (
    ((select max(id) from person_visits) + 1),
    (select id from person where name = 'Dmitriy'),
    (select min(pizzeria_id) from menu
    join 
    (select id from pizzeria where name <> (select pizzeria_name from mv_dmitriy_visits_and_eats)) as pizz
    on menu.pizzeria_id = pizz.id
    where price < 800),
    '2022-01-08'
)

refresh materialized view mv_dmitriy_visits_and_eats;