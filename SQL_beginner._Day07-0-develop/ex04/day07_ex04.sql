select name, count(visit_date) as count_of_visits from person
join person_visits on person.id = person_visits.person_id
group by name
having count(visit_date) > 3;