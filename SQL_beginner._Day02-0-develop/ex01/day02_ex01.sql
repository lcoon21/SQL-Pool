select missing_dates::date from generate_series(date '2022-01-01',date '2022-01-10','1 day') as missing_dates
left join person_visits on person_visits.visit_date = missing_dates.missing_dates
		and (person_visits.person_id = 1 or person_visits.person_id = 2)
where person_visits.person_id is null
order by missing_dates;