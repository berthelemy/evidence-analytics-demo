---
title: Projects
sidebar_position: 4
sidebar_link: true
---
{@partial "alert.md"}


```sql DimProjects
select 
  project_name
  , project_description
  , project_city
  , project_country_code
  , e.Economy as economy
  , e.Region as region
  , e.IncomeGroup as IncomeGroup

from Learning.DimProjects

JOIN CSV.ISO3166 AS i ON i.Alpha_2Code = project_country_code
JOIN CSV.economies2025 AS e ON e.Code = i.Alpha_3Code

```

```sql count_projects_by_country
select
    count(project_name) AS count
    , project_country_code
    , economy
    , IncomeGroup
from ${DimProjects}
group by economy, IncomeGroup, project_country_code
```

```sql count_projects
select
    count(project_name) AS count
from Learning.DimProjects
```

```sql count_locations
select
    count(distinct(location_id)) AS count
from Learning.DimProjects
```



<BigValue
  title='Active projects'
  data={count_projects} 
  value=count
/>

<BigValue
  title='Project locations'
  data={count_locations} 
  value=count
/>



<AreaMap 
    data={count_projects_by_country} 
    areaCol=project_country_code
    geoJsonUrl='https://d2ad6b4ur7yvpq.cloudfront.net/naturalearth-3.3.0/ne_110m_admin_0_countries.geojson'
    geoId=iso_a2
    value=count
    tooltip={[
    {id: 'economy', title:'Country:', showColumnName: false, valueClass: 'text-l font-bold'},
    {id: 'IncomeGroup', title:'Income group:', fieldClass: 'text-[grey]', valueClass: 'text-[green]'},
    {id: 'count', title:'Number of projects:', showColumnName: true, valueClass: 'font mt-1'}
    ]}
/>

<DataTable data={DimProjects} search=true>
  <Column id=project_name/> 
	<Column id=project_description/> 
	<Column id=project_city/> 
	<Column id=project_country/> 
</DataTable>


