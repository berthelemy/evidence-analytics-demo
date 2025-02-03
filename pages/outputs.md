---
title: Outputs
sidebar_position: 4
queries:
  - visits: visits.sql
---

{@partial "alert.md"}

{@partial "sources.md"}

In our [Theory of Change](/theory-of-change), we describe the outputs from our [Activities](/activities). The primary one is the number of bike journeys.

```sql bike_journeys
select
  date
  , Journeys
from CSV.bike_journeys
```

```sql research
select
  count(title) as count
  , '7' as last_year_count
from CSV.input_research_papers
```



```sql outputs_misc
select
  '12504000' as gov_infrastructure
  , '8000000' as priv_infrastructure
  , '0.25' as confidence_levels_2025
  , '0.01' as confidence_levels_delta
  , '4284' as bikes_repaired_2025
  , '0.35' as bikes_repaired_delta
  , '2030' as bikes_sold_2025
  , '-0.01' as bikes_sold_delta

```



```sql count_people
select
    count(id) AS count
from Learning.DimPeople
```

<Grid cols="3">

<BigValue
  title='Number of research papers'
  data={research} 
  value=count
  fmt=num0
  comparison=last_year_count
  comparisonDelta=false
  comparisonTitle="Last year"
/>

<BigValue
  title='Government infrastructure investment'
  data={outputs_misc} 
  value=gov_infrastructure
  fmt=usd
/>


<BigValue
  title='Number of people engaging with service'
  data={count_people}
  fmt=num0
  value=count
  />

</Grid>

## Bike journeys

<BarChart
  data={bike_journeys}
  y=Journeys
  yAxisTitle='Number of bike journeys'
  />

```sql countVisits
    select count(visit_id)
    from ${visits}
```

## Visits to our centres

To date, we have had <Value data={countVisits} fmt=num0 /> visits to our local premises

```sql regions
select Region
from ${visits}
group by Region
```
<Grid cols=2>

<Dropdown
    data={regions} 
    name=region_picker
    value=Region
    title="Select the regions to explore"
    multiple=true
    selectAllByDefault=true
/>


<DateRange
    title=""
    name=date_range
    data={visits}
    dates=visit_date
/>
</Grid>

```sql visits_by_location
select
    count(visit_id) as number_visits
    , latitude
    , longitude
    , city
    , country
    , Region

from ${visits}
where region IN ${inputs.region_picker.value}
  and (visit_date between '${inputs.date_range.start}' and '${inputs.date_range.end}')
group by latitude, longitude, city, country, region

```

<BubbleMap 
    data={visits_by_location} 
    lat=latitude
    long=longitude
    size=number_visits 
    value=number_visits 
    pointName=city
/>





```sql VisitsByMonth
select
      date_trunc('month', visit_date) as period
    , reason
    , count(visit_id) as 'number_visits'
    , region  -- FIX THIS
    , sum(count(visit_id))
    over (order by visit_date) as CumulativeVisits

from ${visits}
where (visit_date between '${inputs.date_range.start}' and '${inputs.date_range.end}')
group by visit_date, reason, region
```



```sql visits_by_period
select 
  date_trunc('week', visit_date) as period,
  count(*) as number_visits,
  reason
from ${visits}
where visit_date between '${inputs.date_range.start}' and '${inputs.date_range.end}'
  and region IN ${inputs.region_picker.value}
group by all
order by period
```

<BarChart
  data={visits_by_period}
  x=period
  y=number_visits
  series=reason
  yAxisTitle="Number of visits">
  <ReferenceLine data={keyevents} x=event_date label=name hideValue/>
</BarChart>



```sql countVisits
    select count(visit_id)
    from ${visits}
```



```sql keyevents
select * from CSV.keyevents
```
