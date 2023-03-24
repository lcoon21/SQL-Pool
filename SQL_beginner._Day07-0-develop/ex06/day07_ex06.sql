select name,
    count(person_order.menu_id) as count_of_orders,
    round(avg(price)) as average_price,
    round(max(price)) as max_price,
    round(min(price)) as min_price
from pizzeria
    join menu on pizzeria.id = menu.pizzeria_id
    join person_order on menu.id = person_order.menu_id
group by name
order by name;