---
title: Training courses
sidebar_position: 3
sidebar_link: true
queries:
  - courses: courses.sql
---
{@partial "alert.md"}

```sql countCourses
    select
      count(distinct(course_id)) as count
    from ${courses}
```


```sql countEnrolments
    select
      count(enrolment_id) as count
    from ${courses}
```

```sql countPeople
    select
      count(distinct(person_id)) as count
    from ${courses}
```

<BigValue
  title="Number of courses"
  data={countCourses}
  value=count
  fmt=num0
  />

  <BigValue
  title="Number of enrolments"
  data={countEnrolments}
  value=count
  fmt=num0
  />

<BigValue
  title="Number of people"
  data={countPeople}
  value=count
  fmt=num0
  />



