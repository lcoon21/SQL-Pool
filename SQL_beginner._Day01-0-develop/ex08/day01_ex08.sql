select order_date, concat(person_temp.name,' (age:', person_temp.age, ')') as person_information from person_order
natural join (select id as person_id, person.name,person.age from person) as person_temp
order by order_date, person_information;
