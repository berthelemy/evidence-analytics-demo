---
title: About the data
sidebar_link: true
sidebar_position: 6
full_width: false
---
{@partial "alert.md"}

{@partial "sources.md"}

This site is built using [Evidence.dev](https://evidence.dev), an open source framework for creating data analytics websites.

The data driving this comes from:

- [World Bank list of countries, regions and economies](https://datahelpdesk.worldbank.org/knowledgebase/articles/906519-world-bank-country-and-lending-groups)
- ISO3166 - list of countries and country codes - from [IBAN.com](https://www.iban.com/country-codes)
- CSV of key events
- CSV of sample data (ie. not modelling how the systems might really work)
- Sample SQLITE database of an organisation's systems (called Learning)

```sql sources
select * from information_schema.tables
```
<DataTable data={sources}>
  
  <Column id='table_schema'/>
  <Column id='table_name'/>
  </DataTable>
