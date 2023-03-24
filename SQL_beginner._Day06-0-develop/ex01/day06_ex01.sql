WITH orders AS (
    SELECT person_id,
        pizzeria_id,
        COUNT(pizzeria_id) AS visits
    FROM person_order
        JOIN menu ON person_order.menu_id = menu.id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    GROUP BY person_id,
        pizzeria_id
    ORDER BY person_id
)
insert into person_discounts (id, person_id, pizzeria_id, discount)
select row_number() over (
        order by 1
    ) as id,
    person_id,
    pizzeria_id,
    (
        case
            when visits = 1 then 10.5
            when visits = 2 then 22
            else 30
        end
    )
from orders;