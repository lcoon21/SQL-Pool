create or replace function get_rate_to_usd(cur_id bigint)
    returns numeric
as $$
declare
    answer numeric;
begin
    select currency.rate_to_usd
    into answer
    from currency
    where cur_id = currency.id
    order by currency.updated desc
    limit 1;
    if (answer is not null) then
        return answer;
    else
        return 1.0;
    end if;
end;
$$ language plpgsql;

create or replace function get_currency_name(cur_id integer)
    returns varchar
as $$
declare
    answer varchar;
begin
    select currency.name
    into answer
    from currency
    where cur_id = currency.id
    limit 1;
    if (answer is not null) then
        return answer;
    else
        return null;
    end if;
end;
$$ language plpgsql;

select coalesce(u.name, 'not defined')                           as name,
       coalesce(u.lastname, 'not defined')                       as lastname,
       b.type                                                    as type,
       sum(money)                                                as volume,
       coalesce(get_currency_name(b.currency_id), 'not defined') as currency_name,
       get_rate_to_usd(b.currency_id)                            as last_rate_to_usd,
       sum(money) * get_rate_to_usd(b.currency_id)               as total_volume_in_usd
from balance as b
         full join "user" as u on b.user_id = u.id
group by u.name, u.lastname, b.type, b.currency_id
order by name desc, lastname, type;