-- Session 1

begin;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

-- Session 2

begin;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
update pizzeria set rating = 1 where name = 'Pizza Hut';
commit;
select sum(rating) from pizzeria;