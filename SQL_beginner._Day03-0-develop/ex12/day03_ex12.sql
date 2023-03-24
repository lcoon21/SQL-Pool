insert into person_order 
(select person.id + (select max(id) from person_order),
person.id,
(select menu.id from menu where menu.pizza_name = 'greek pizza'),
'2022-02-25' 
from person);