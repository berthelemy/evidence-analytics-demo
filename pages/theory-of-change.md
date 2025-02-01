---
title: Theory of Change
sidebar_position: 10
sidebar_link: true
---
<script>
  import Mermaid from '../../components/Mermaid.svelte';
</script>

{@partial "alert.md"}

{@partial "sources.md"}

Our **Theory of Change** describes how we expect our actions to lead to lasting impact.

<Alert status="info">
<p align="center"><a href="/activities">Activities</a> --> <a href="/outputs">Outputs</a> --> <a href="/impact">Impact</a></p>
</Alert>

<Mermaid id=sales>
graph TD
  classDef impact fill:#fdf,stroke:#333,stroke-width:4px;
  subgraph ACTIVITIES
    research("Research") --> lobbying("Lobbying")
    localPremises --> lobbying
    localPremises("Local premises")-->advice("Advice<br>& support")
    localPremises-->repairs("Bike<br>repairs")
    localPremises-->sales("Sale of bikes<br>and parts")
    localPremises("Local<br>premises")-->training
  end
  subgraph OUTPUTS
  lobbying --> improvedInfrastructure("Improved cycling<br>infrastructure")
  lobbying --> financialIncentives("Financial incentives<br>for bike use")
  improvedInfrastructure --> moreBikeJourneys
  advice-->confidence("Improved<br>confidence")
  training("Bike repair<br>training") --> betterBikes
  sales-->betterBikes
  repairs-->betterBikes("Better<br>bikes")
  financialIncentives-->moreBikeJourneys
  confidence-->moreBikeJourneys
  betterBikes --> moreBikeJourneys("`**More bike journeys**`")
end
subgraph IMPACT
  moreBikeJourneys --> improvedHealth("Improved<br>public health")
  moreBikeJourneys --> lowerCarbonEmissions("Lower<br>carbon emissions")
  moreBikeJourneys --> infrastructureEfficiencies("More efficient use<br>of road infrastructure")
end
class moreBikeJourneys impact
</Mermaid>

For each Activity, Outcome and Impact element we have identified key metrics to help track our journey.

These metrics, and the underlying elements, may change over time as we learn more and adapt to the changing political, meteorological and economic environment.