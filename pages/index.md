---
title: Mockup Data Dashboard
sidebar_link: true
sidebar_position: 1
full_width: false
queries:
  - sample_data: sample_data.sql
  - count_locations: count_locations.sql
og:
  title: Theory of Change / Return on Investment
  description: A mockup dashboard showing one way of measuring activities, outputs and impact - supporting an organisational Theory of Change - using the Evidence.dev platform
  image: '/evidence-image.png'

---
{@partial "alert.md"}

{@partial "sources.md"}

```sql running_total_expenditure
select
  sum(quantity) as total
from CSV.sample_data2
where item_type = 'expenditure'

```


Human Transport are the world's leading not-for-profit focussed on the human-powered transport sector.

With **<Value description="Each centre is a base from which we provide training, sales and advice, and carry out research and lobbying." data={count_locations} />** centres in major cities throughout the world, we provide practical assistance and policy lobbying to encourage more use of human-powered transport. Since beginning our work, we have spent around **<Value fmt="usd" data="{running_total_expenditure}" Column="total"/>** - leading to [significant improvements](/impact) in air quality, health and carbon emissions.

Our work is defined and measured according to our [Theory of Change](/theory-of-change). This is constantly updated as we learn more and adjust what we do to maximise our impact.

The theory of change is based on a simple model:

<Alert status="info">
<p align="center"><strong><a href="/activities">Activities</a></strong> --> <strong><a href="/outputs">Outputs</a></strong> --> <strong><a href="impact">Impact</a></strong></p>
</Alert>

Obviously, the most important of these is impact... This is what we are aiming towards. Our intent is that our activities will deliver measurable outputs that lead to lasting impact.

This dashboard provides indicators so you can see how we are doing on each of these elements.

Take a look at each section for the numbers and the story behind those numbers.

<Image
  url="beijing-3675892_1280.jpg"
  description="Battered tricyle on a city street"
  />


