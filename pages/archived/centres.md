---
title: Local centres
sidebar_position: 3
sidebar_link: true
queries:
  - visits: visits.sql
---

{@partial "alert.md"}

```sql countVisits
    select count(visit_id)
    from ${visits}
```

To date, we have had <Value data={countVisits} fmt=num0 /> visits to our local premises around the world.

```sql keyevents
select * from CSV.keyevents
```

```sql regions
select Region
from ${visits}
group by Region
```


<ButtonGroup 
    data={regions} 
    name=region_picker 
    value=Region
    title="Select a region to explore"
/>

```sql visits_by_location
select
    count(visit_id) as number_visits
    , latitude
    , longitude
    , city
    , country
    , Region

from ${visits}
where region = '${inputs.region_picker}'
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

<DateRange
    title="Select the date range"
    name=date_range
    data={visits}
    dates=visit_date
/>




```sql VisitsByMonth
select
      date_trunc('${inputs.period.value}', visit_date) as period
 --   , date_part('month',visit_date) as month
  --  , date_part('year', visit_date) as year
    , reason
    , count(visit_id) as 'number_visits'
    , region  -- FIX THIS
    , sum(count(visit_id))
    over (order by visit_date) as CumulativeVisits

from ${visits}
where (visit_date between '${inputs.date_range.start}' and '${inputs.date_range.end}')
    and region = '${inputs.region_picker}'
group by visit_date, reason, region
```







<Dropdown name=period title="Time Period">
  <DropdownOption value=day valueLabel="Day"/>
  <DropdownOption value=week valueLabel="Week"/>
  <DropdownOption value=month valueLabel="Month"/>
</Dropdown>

<LineChart 
    data={VisitsByMonth} 
    x=period
    y=CumulativeVisits
    y2=number_visits
    y2SeriesType=bar
    y2series=reason
    yAxisTitle="Cumulative number of visits"
    y2AxisTitle="Number of visits per day" >
    <ReferenceLine data={keyevents} x=event_date label=name hideValue/>
</LineChart>


```sql visits_by_period
select 
  date_trunc('${inputs.period.value}', visit_date) as period,
  count(*) as number_visits,
  reason
from ${visits}
where visit_date between '${inputs.date_range.start}' and '${inputs.date_range.end}'
  and region = '${inputs.region_picker}'
group by all
order by period
```

<BarChart
  data={visits_by_period}
  x=period
  y=number_visits
  series=reason
  yAxisTitle="Number of visits"
/>

