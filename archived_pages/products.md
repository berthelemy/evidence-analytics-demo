---
title: Digital Learning Products
sidebar_link: false
sidebar_position: 5
---
{@partial "alert.md"}

```sql products
select * from Learning.DimProducts
```

<DataTable data={products} search=true>
    <Column id=name/>
    <Column id=type/>
    <Column id=launch_date fmt=longdate/>
    <Column id=review_date fmt=longdate/>
    <Column id=published/>
</DataTable>

{#each products as product}

{#if product.review_date < product.today }
{#if product.published = true }

Product: *{product.name}* **REQUIRES REVIEW**

{/if}
{/if}

{/each}

