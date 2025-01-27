SELECT v.id AS visit_id
      , visit_date
      , r.reason
      , l.city
      , l.country_code
      , l.latitude
      , l.longitude
       , p.gender
       , p.education
  FROM visits AS v
       JOIN
       reasons AS r ON r.id = reason_id
       JOIN
       locations AS l ON l.id = location_id
       JOIN
       people AS p ON p.id = person_id