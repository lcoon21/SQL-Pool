-- Session 1

begin;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
select * from pizzeria where name  = 'Pizza Hut';
select * from pizzeria where name  = 'Pizza Hut';
commit;
select * from pizzeria where name  = 'Pizza Hut';

-- Session 2

begin;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
select * from pizzeria where name  = 'Pizza Hut';
update pizzeria set rating = 3.0 where name = 'Pizza Hut';
commit;
select * from pizzeria where name  = 'Pizza Hut';