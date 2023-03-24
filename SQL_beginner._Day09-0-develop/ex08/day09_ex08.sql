create or replace function fnc_fibonacci(pstop integer default 10)
returns setof integer as $$ with recursive t(a, b) as (
        values(0, 1)
        union all
        select greatest(a, b),
            a + b as a
        from t
        where b < pstop
    )
select a
from t;
$$ language SQL;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
