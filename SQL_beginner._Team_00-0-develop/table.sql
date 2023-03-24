create table way
( id bigint primary key ,
  point1 varchar not null,
  point2 varchar not null,
  cost integer not null default 0
  );



insert into way values (1, 'a', 'a', 0);
insert into way values (2, 'b', 'b', 0);
insert into way values (3, 'c', 'c', 0);
insert into way values (4, 'd', 'd', 0);

insert into way values (5, 'a', 'd', 20);
insert into way values (6, 'd', 'a', 20);

insert into way values (7, 'b', 'd', 25);
insert into way values (8, 'd', 'b', 25);

insert into way values (9, 'c', 'd', 30);
insert into way values (10, 'd', 'c', 30);

insert into way values (11, 'a', 'b', 10);
insert into way values (12, 'b', 'a', 10);

insert into way values (13, 'a', 'c', 15);
insert into way values (14, 'c', 'a', 15);

insert into way values (15, 'b', 'c', 35);
insert into way values (16, 'c', 'b', 35);


select * from way;




