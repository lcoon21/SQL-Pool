select menu.id as menu_id from menu
except
select person_order.menu_id from person_order
order by menu_id;