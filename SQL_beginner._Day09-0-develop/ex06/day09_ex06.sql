create or replace function fnc_person_visits_and_eats_on_date(
        pperson varchar default 'Dmitriy',
        pprice int default 500,
        pdate date default '2022-01-08'
    ) returns table(pizzeria_name varchar) as $$ begin return query
select distinct pizzeria.name as pizzeria_name
from pizzeria
    join person_visits on pizzeria.id = person_visits.pizzeria_id
    and visit_date = pdate
    join person on person_visits.person_id = person.id
    and person.name = pperson
    join menu on pizzeria.id = menu.pizzeria_id
where menu.price < pprice;
end;
$$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(
        pperson := 'Anna',
        pprice := 1300,
        pdate := '2022-01-01'
    );