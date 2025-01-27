---
title: Human Transport Data Dashboard
sidebar_link: false
---
{@partial "alert.md"}

This page provides summary data. For more detail click through to the relevant pages.


```sql projects
select * from Learning.DimProjects
```

```sql count_projects_by_country
select
    count(project_name) AS count
    , project_country_code
from Learning.DimProjects
group by project_country_code
```

```sql count_projects
select
    count(project_name) AS count
from Learning.DimProjects
```

```sql count_people
select
    count(id) AS count
from Learning.DimPeople
```

```sql count_locations
select
    count(distinct(location_id)) AS count
from Learning.DimProjects
```

```sql count_products
select
    count(ID) AS count
from Learning.DimProducts
```
<Grid cols="3">
<Image 
    url="/beijing-3675892_1280.jpg"
    description="Bicycle"
/>
<BigValue
  title='Active projects'
  data={count_projects} 
  value=count
  link='/projects'
/>

<BigValue
  title='Number of people'
  data={count_people} 
  value=count
  link='/people'
  fmt=num0
/>

<BigValue
  title='Project locations'
  data={count_locations} 
  value=count
  link='/projects'
/>

<BigValue
  title='Digital products'
  data={count_products} 
  value=count
  link='/products'
/>


</Grid>

<Grid cols="2">

<BigLink href="/people">
    Who do we work with?
</BigLink>

<BigLink href="/projects">
    What do we do?
</BigLink>


</Grid>

