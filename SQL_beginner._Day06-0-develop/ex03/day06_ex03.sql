create unique index idx_person_discounts_unique on person_discounts(person_id, pizzeria_id);

set enable_seqscan=off;

explain analyze select person_id, pizzeria_id,discount from person_discounts
where pizzeria_id = 1;