with cte_part as (select missing_dates::date from generate_series(date '2022-01-01',date '2022-01-10','1 day') 
as missing_dates)

select missing_dates from cte_part
left join person_visits on person_visits.visit_date = cte_part.missing_dates
		and (person_visits.person_id = 1 or person_visits.person_id = 2)
where person_visits.person_id is null
order by missing_dates;