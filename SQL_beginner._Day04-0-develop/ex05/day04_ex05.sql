create or replace view v_price_with_discount as
(select person.name, menu.pizza_name as pizza_name, menu.price, 
round(menu.price * 0.9) as discount_price from person
join person_order on person.id = person_order.person_id
join menu on person_order.menu_id = menu.id)
order by 1, 2;