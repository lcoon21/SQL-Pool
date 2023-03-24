select address,
       round(max(age) - (min(age) / max(age)::decimal), 2) as formula,
       round(avg(age), 2) as average,
       (
        case
            when max(age) - (min(age) / max(age)) > avg(age) then TRUE
            else FALSE
        end
        ) as comparison
from person
group by 1
order by 1;