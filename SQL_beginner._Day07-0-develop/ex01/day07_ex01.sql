select name, count(visit_date) as count_of_visits from person_visits
join person on person_visits.person_id = person.id
group by name
order by 2 desc, 1 asc
limit 4;