with temp_table as (select * from person)

select person.name as person_name1, temp_table.name as person_name2, person.address as common_address
from person, temp_table
where person.address = temp_table.address and person.name <> temp_table.name
and person.id > temp_table.id
order by person_name1, person_name2, common_address;