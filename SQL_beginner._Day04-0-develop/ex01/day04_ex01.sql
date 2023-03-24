create or replace view v_persons_name as
select person.name
from person
order by name;