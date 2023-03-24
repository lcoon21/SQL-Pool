
-- 1 session

begin;
update pizzeria set rating = 5 where name = 'Pizza Hut';
commit;

-- 2 session

select * from pizzeria where name  = 'Pizza Hut';
select * from pizzeria where name  = 'Pizza Hut';