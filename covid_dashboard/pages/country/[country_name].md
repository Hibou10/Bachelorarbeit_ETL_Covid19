---
title: Country Dashboard
---

# {params.country} – COVID-19 {inputs.metric.label}


<Dropdown name=metric defaultValue="infections">
  <DropdownOption value="infections" valueLabel="Infections"/>
  <DropdownOption value="incidence" valueLabel="Incidence"/>
  <DropdownOption value="vaccinations" valueLabel="Vaccinations"/>
  <DropdownOption value="deaths" valueLabel="Deaths"/>
</Dropdown>

```sql country_data
select
  year,
  infections,
  incidence,
  vaccinations,
  deaths
from cvd.covid
where country = '${params.country_name}'
order by year
```

<LineChart data={country_data} x=year y={inputs.metric.value} title="COVID-19 {inputs.metric.label} in {params.country} (Yearly)" />
