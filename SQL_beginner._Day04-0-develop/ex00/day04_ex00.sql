create or replace view v_persons_female as
select *
from person
where person.gender = 'female';
create or replace view v_persons_male as
select *
from person
where person.gender = 'male';