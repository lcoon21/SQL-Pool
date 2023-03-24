select 
	(select name from person
	where person.id = person_order.person_id)
from person_order
where  (order_date='01-07-2022' and (menu_id=13 or menu_id=14 or menu_id=18));