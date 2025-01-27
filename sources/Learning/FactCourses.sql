SELECT c.id AS course_id,
       name,
       type,
       cn.id as enrolment_id,
       person_id,
       gender
  FROM courses AS c
       JOIN
       course_types AS ct ON ct.id = type_id
       LEFT JOIN
       course_enrolments AS cn ON cn.course_id = c.id
       LEFT JOIN
       people AS p ON p.id = person_id;
