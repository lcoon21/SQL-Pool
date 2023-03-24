select person.name, pizza_name, price, round(price - (price * discount/100)) as discount_price, pizzeria.name as pizzeria_name
from person
join person_order on person.id = person_order.person_id
join menu on person_order.menu_id = menu.id
join person_discounts on person.id = person_discounts.person_id
join pizzeria on person_discounts.pizzeria_id = pizzeria.id
order by 1, 2;