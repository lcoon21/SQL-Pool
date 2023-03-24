insert into currency
values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency
values (100, 'EUR', 0.79, '2022-01-08 13:29');



create or replace function get_rate_to_usd_near_date(cur_id bigint, tm_up timestamp)
    returns numeric
as $$
declare
    answer numeric;
begin
    select rate_to_usd
    into answer
    from ((select c1.rate_to_usd, c1.updated
           from currency as c1
           where cur_id = c1.id
             and tm_up >= c1.updated
           order by c1.updated desc
           limit 1)
          union
          (select c2.rate_to_usd, c2.updated
           from currency AS c2
           where cur_id = c2.id
             and tm_up < c2.updated
           order by c2.updated
           limit 1)
          order by updated
          limit 1) AS tb
    limit 1;
    if (answer is not null) then
        return answer;
    else
        return null;
    end if;
end;
$$ language plpgsql;

select coalesce(u.name, 'not defined')                         as name,
       coalesce(u.lastname, 'not defined')                     as lastname,
       coalesce(get_currency_name(currency_id), 'not defined') as currency_name,
       get_rate_to_usd_near_date(currency_id, updated) * money as currency_in_usd
from balance as b
         FULL join "user" as u on u.id = b.user_id
where get_rate_to_usd_near_date(currency_id, updated) is not null
order by name desc, lastname, currency_name;

