---
title: Impact
sidebar_position: 5
queries:
  - visits: visits.sql
---

{@partial "alert.md"}

{@partial "sources.md"}

### Impact

```sql impact
select
  45 as air
  , -0.6 as air_comp
  , 15 as cardioMortality
  , -3 as cardio_comp
  , 100000 as carbonEmissions
  , -695 as carbon_comp
```

<Grid cols="3">


<BigValue
  title='Air quality index'
  data={impact} 
  value=air
  fmt=num0
  comparison=air_comp
  comparisonTitle="YoY change"
  downIsGood=true
  comparisonFmt=num1
/>

<BigValue
  title='Cardio mortality rate'
  data={impact} 
  value=cardioMortality
  fmt=num0
  comparison=cardio_comp
  comparisonTitle="YoY change"
  downIsGood=true
  comparisonFmt=num1
/>

<BigValue
  title='Carbon emissions'
  data={impact} 
  value=carbonEmissions
  fmt = '#,##0 "kg"'
  comparison=carbon_comp
  comparisonFmt = '#,##0 "kg"'
  comparisonTitle="YoY change"
  downIsGood=true
/>

</Grid>

---
