---
title: Activities
sidebar_position: 3
sidebar_link: true
queries:
  - count_locations: count_locations.sql
  - sample_data: sample_data.sql
  - visits: visits.sql
---
{@partial "alert.md"}

{@partial "sources.md"}

```sql sample_data2
select * from CSV.sample_data2
order by measurement_date DESC
```

```sql expenditure
select
  quantity as expenditure
  , SUM(quantity) OVER (ORDER BY measurement_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_expenditure
  , measurement_date
from sample_data2
where item_type = 'expenditure'
order by measurement_date desc
```

```sql revenue
select
  quantity as revenue
  , SUM(quantity) OVER (ORDER BY measurement_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_revenue
  , measurement_date
from sample_data2
where item_type = 'revenue'
order by measurement_date desc
```

```sql profit
select
  measurement_date
  , sum(quantity) as profit
from sample_data2
where item_type = 'revenue' or item_type = 'expenditure'
group by measurement_date
order by measurement_date desc
```

```sql count_location_countries
select
  count(distinct(country_code)) as count
from Learning.DimLocations

```

```sql count_products
select
    count(ID) AS count
from Learning.DimProducts
```

## Finance

<Grid cols=3>

  <BigValue
  title='Total Expenditure'
  data={expenditure} 
  fmt=usd
  sparkline = measurement_date
  value=running_total_expenditure
/>

  <BigValue
  title='Total revenue'
  data={revenue} 
  fmt=usd
  sparkline=measurement_date
  value=running_total_revenue
/>

  <BigValue
  title='Contribution / Profit'
  data={profit} 
  fmt=usd
  sparkline=measurement_date
  value=profit
  
/>

</Grid>

```sql exp_rev
select * from sample_data2
where item_type = 'expenditure' OR item_type = 'revenue'
order by measurement_date
```

<BarChart 
    data={exp_rev}
    title='Expenditure vs Revenue by month'
    x=measurement_date
    y=quantity
    yFmt=usd0
    series=item_type
    type=grouped
/>



## People

```sql staffCount
select
  quantity as FTE
  , measurement_date
from sample_data2
where item_type = 'FTE'
order by measurement_date desc
```

```sql staffCount
select
  quantity as FTE
  , measurement_date
from sample_data2
where item_type = 'FTE'
order by measurement_date desc
```

```sql volunteerHours
select
  quantity as volunteer_hours
  , measurement_date
from sample_data2
where item_type = 'volunteer_hours'
order by measurement_date desc
```

```sql people_count
select
  count(id) as count
from Learning.DimPeople
```

<Grid cols=3>
 <BigValue
  title='Current number of FTE staff'
  data={staffCount} 
  sparkline=measurement_date
  value=FTE
/>

 <BigValue
  title='Last month volunteer hours'
  data={volunteerHours} 
  sparkline=measurement_date
  fmt=num0
  value=volunteer_hours
/>
 <BigValue
  title='Number of people engaged with'
  data={people_count} 
  fmt=num0
  value=count
/>

</Grid>

Our primary target group is those from lower-middle income level countries.

Select the income levels dropdown to see explore more about the people we work with.

```sql unique_Incomes
select e.IncomeGroup AS IncomeGroup,
from CSV.economies2025 AS e
where IncomeGroup IS NOT NULL
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

```sql users_by_country
select country_code, economy, IncomeGroup, count(userID) AS count
from ${DimUsers}
GROUP BY country_code, economy, IncomeGroup

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

<Grid cols=2>
<ECharts config={
    {
        title: {
            text: 'Gender'
        },
        tooltip: {
            formatter: '{b}: {d}%'
        },
        label: {
          position: 'inside'
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

<ECharts config={
    {
        title: {
            text: 'Education levels'},
        tooltip: {
            formatter: '{b}: {d}%'
        },
        label: {
          position: 'inside'
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

</Grid>



<AreaMap 
    data={users_by_country} 
    areaCol=country_code
    geoJsonUrl=https://d2ad6b4ur7yvpq.cloudfront.net/naturalearth-3.3.0/ne_110m_admin_0_countries.geojson
    geoId=wb_a2
    value=count
    title='Number of service users from each country'
    startingZoom=4
    tooltip={[
    {id: 'economy', showColumnName: false, valueClass: 'text-xl font-bold'},
    {id: 'IncomeGroup', title:'Income Group', fieldClass: 'text-[grey]', valueClass: 'text-[green]'},
    {id: 'count', title:'Number of service users', showColumnName: true, valueClass: 'font mt-1'}
    ]}
/>

 

## Local centres
<Grid cols=2>
<BigValue
  title='Number of locations'
  data={count_locations} 
  value=count
/>

 <BigValue
  title='Number of countries'
  data={count_location_countries} 
  value=count
/>

  </Grid>
