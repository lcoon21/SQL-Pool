-- Session 1

begin;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
select sum(rating) from pizzeria;
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

-- Session 2

begin;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
update pizzeria set rating = 1 where name = 'Pizza Hut';
commit;
select sum(rating) from pizzeria;