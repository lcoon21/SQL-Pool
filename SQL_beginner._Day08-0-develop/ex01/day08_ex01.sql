-- Session 1

begin;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
select * from pizzeria where name  = 'Pizza Hut';
update pizzeria set rating = 4 where name = 'Pizza Hut';
commit;
select * from pizzeria where name  = 'Pizza Hut';

-- Session 2

begin;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
select * from pizzeria where name  = 'Pizza Hut';
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
commit;
select * from pizzeria where name  = 'Pizza Hut';