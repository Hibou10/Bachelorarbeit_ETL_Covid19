---
title: Country Dashboard
---

# {inputs.country.value}

```sql country_metrics
select
  year,
  infections,
  incidence,
  vaccinations,
  deaths
from cvd.covid
where country = '${inputs.country.value}'
order by year
```

<LineChart data={country_metrics} title="COVID-19 {inputs.metric.label} in {inputs.country.value} Over Time" x=year y={inputs.metric.value} />