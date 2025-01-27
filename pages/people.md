---
title: People we work with
sidebar_position: 2
---
{@partial "alert.md"}

Our primary target group is those on lower-middle incomes, from lower-middle income level countries.

Select the income levels dropdown to see explore more about the people we work with.

```sql unique_Incomes
select e.IncomeGroup AS IncomeGroup,
from CSV.economies2025 AS e
group by 1
```

<Dropdown
    name=selected_income
    data={unique_Incomes}
    value=IncomeGroup
    multiple=true
    selectAllByDefault=true
/>

```sql DimUsers
select
    id as userID
    , country_code
    , e.Economy as economy
    , e.Region as region
    , e.IncomeGroup as IncomeGroup
    , gender
    , education
from Learning.DimPeople

JOIN CSV.ISO3166 AS i ON i.Alpha_2Code = country_code
JOIN CSV.economies2025 AS e ON e.Code = i.Alpha_3Code

WHERE IncomeGroup IN ${inputs.selected_income.value}

```



```sql gender_groups
select gender as name, count(UserID) as value
from ${DimUsers}
group by gender
```

```sql education_groups
select education as name, count(UserID) as value
from ${DimUsers}
group by education
```
<BarChart
    data={gender_groups}
    x=name
    y=value
    title="Count of people by gender"
/>




<ECharts config={
    {
        title: {
            text: 'Education levels'},
        tooltip: {
            formatter: '{b}: {c} ({d}%)'
        },
        series: [
        {
          name: 'Education',
          type: 'pie',
          data: [...education_groups]
        }
      ]
      }
    }
/>



<BarChart
    data={education_groups}
    x=name
    y=value
    title="Count of people by education level"
/>


<ECharts config={
    {
        title: {
            text: 'Gender'
        },
        tooltip: {
            formatter: '{b}: {c} ({d}%)'
        },
        series: [
        {
          name: 'Gender',
          type: 'pie',
          data: [...gender_groups]
        }
      ]
      }
    }
/>





<AreaMap 
    data={users_by_country} 
    areaCol=country_code
    geoJsonUrl=https://d2ad6b4ur7yvpq.cloudfront.net/naturalearth-3.3.0/ne_110m_admin_0_countries.geojson
    geoId=wb_a2
    value=count
    title='Number of users from each country'
    startingZoom=4
    tooltip={[
    {id: 'economy', showColumnName: false, valueClass: 'text-l font-bold'},
    {id: 'IncomeGroup', title:'Income Group', fieldClass: 'text-[grey]', valueClass: 'text-[green]'},
    {id: 'count', title:'Number of users', showColumnName: true, valueClass: 'font mt-1'}
    ]}
/>



<DataTable data={DimUsers} search=true />

```sql users_by_country
select country_code, economy, IncomeGroup, count(userID) AS count
from ${DimUsers}
GROUP BY economy, IncomeGroup, country_code

```




