-- Session 1

begin;
select * from pizzeria;
update pizzeria set rating = 1 where id = 1;
update pizzeria set rating = 3 where id = 2;
commit;
select * from pizzeria;

-- Session 2

begin;
select * from pizzeria;
update pizzeria set rating = 2 where id = 2;
update pizzeria set rating = 4 where id = 1;
commit;
select sum(rating) from pizzeria;