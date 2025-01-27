select *

from Learning.FactCourses

--join CSV.ISO3166 as i on i.Alpha_2Code = country_code
--join CSV.economies2025 as e on e.Code = i.Alpha_3Code

order by course_id