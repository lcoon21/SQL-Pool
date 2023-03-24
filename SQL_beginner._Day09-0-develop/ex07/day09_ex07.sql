create or replace function func_minimum(variadic mas numeric[]) returns integer as $$
    select min(value)
        from unnest(mas) value;
$$ language sql;

SELECT func_minimum(VARIADIC ARRAY[10, -1, 5, 4.4]);