create sequence seq_person_discounts as bigint start with 1 increment by 1;


alter table person_discounts
alter column id set default nextval('seq_person_discounts');

select * from person_discounts;