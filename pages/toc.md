---
title: Theory of Change
sidebar_position: 1
---
<script>
  import Mermaid from '../../components/Mermaid.svelte';
</script>

{@partial "alert.md"}

Our **Theory of Change** describes how we expect our actions to lead to lasting impact.

The data dashboard contains key indicators for most elements of the Theory of Change.

<Mermaid id=sales>
graph TD
  classDef outcome fill:#fdf,stroke:#333,stroke-width:4px;
  subgraph LOBBYING
    research("Research") --> lobbying("Lobbying")
    lobbying --> policyChange("Policy Outputs")
    policyChange --> improvedInfrastructure("Improved cycling<br>infrastructure")
    policyChange --> financialIncentives("Financial incentives<br>for bike use")
end
  localPremises --> lobbying
  improvedInfrastructure --> moreBikeJourneys
subgraph LOCAL PREMISES
    localPremises("Local premises")-->advice("Advice<br>& support")
    localPremises-->repairs("Bike<br>repairs")
    localPremises-->sales("Sale of bikes<br>and parts")
    localPremises("Local<br>premises")-->training
end
subgraph OUTPUTS
  improvedInfrastructure --> confidence
  financialIncentives --> betterBikes
  advice-->confidence("Improved<br>confidence")
  training("Bike repair<br>training") --> betterBikes
  sales-->betterBikes
  repairs-->betterBikes("Better<br>bikes")
  financialIncentives-->moreBikeJourneys
  confidence-->moreBikeJourneys
  betterBikes --> moreBikeJourneys("`**More bike journeys**`")
end
subgraph OUTCOMES
  moreBikeJourneys --> improvedHealth("Improved<br>public health")
  moreBikeJourneys --> lowerCarbonEmissions("Lower<br>carbon emissions")
  moreBikeJourneys --> infrastructureEfficiencies("More efficient use<br>of road infrastructure")
end
class moreBikeJourneys outcome
</Mermaid>