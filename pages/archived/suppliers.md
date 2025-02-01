---
title: Suppliers
sidebar_link: true
---
{@partial "alert.md"}

## Overview

```sql suppliers
select
    *,
    Company,
    URL,
    Title,
    "Meta Description" AS desc,
    "Description - English" AS descE
from LD_FRANCE_GOOGLE_SHEET.LTFranceSuppliers_sheet1

```
<DataTable data={suppliers} search=true />

```sql characteristics
select
    count(case when Course == TRUE THEN Company END) AS Course,
    count(case when Agency == TRUE THEN Company END) AS Agency
from LD_FRANCE_GOOGLE_SHEET.LTFranceSuppliers_sheet1
```

<BigValue 
  data={characteristics} 
  value=Course
/>

<BigValue 
  data={characteristics} 
  value=Agency
/>

