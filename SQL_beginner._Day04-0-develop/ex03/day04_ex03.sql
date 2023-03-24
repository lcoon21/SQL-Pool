create or replace view v_generated_dates as
select generated_date::date
from generate_series(date '2022-01-01', date '2022-01-31', '1 day') as generated_date
except
select visit_date
from person_visits
order by 1;