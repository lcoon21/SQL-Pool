select name,rating from pizzeria
where (pizzeria.rating >= 3.5 and pizzeria.rating <= 5);

select name,rating from pizzeria
where (pizzeria.rating between 3.5 and 5);