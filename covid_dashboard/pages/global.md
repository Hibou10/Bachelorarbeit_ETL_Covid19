---
title: Global COVID-19 Dashboard
---

<Details title='Hinweis'>
  Dieses Dashboard zeigt COVID-19 Kennzahlen (Infektionszahlen, Inzidenz, Todesfälle, Impfungen).  
  Mit den Dropdowns kannst du Jahr und Metrik auswählen.
</Details>

```sql years
select distinct cast(extract(year from date) as int) as year
from covid1
order by year
```
<Dropdown data={years} name=year value=year> <DropdownOption value=2020/> <DropdownOption value=2021/> <DropdownOption value=2022/> <DropdownOption value=2023/> </Dropdown> <Dropdown name=metric> <DropdownOption value="total_cases" valueLabel="Infektionszahlen"/> <DropdownOption value="avg_inzidenz" valueLabel="Inzidenz"/> <DropdownOption value="total_deaths" valueLabel="Todesfälle"/> <DropdownOption value="max_vaccinated" valueLabel="Impfquote"/> </Dropdown>


```sql top_countries
select 
    location,
    sum(total_cases) as total_cases,
    round(avg(avg_inzidenz),2) as avg_inzidenz,
    sum(total_deaths) as total_deaths,
    max(max_vaccinated) as max_vaccinated
from covid1
where extract(year from date) = ${inputs.year.value}
group by location
order by
  case '${inputs.metric.value}'
    when 'total_cases' then sum(total_cases)
    when 'avg_inzidenz' then avg(avg_inzidenz)
    when 'total_deaths' then sum(total_deaths)
    when 'max_vaccinated' then max(max_vaccinated)
  end desc
limit 10
```

<BarChart data={top_countries} title="Top 10 Länder – {inputs.metric.label} ({inputs.year.value})" x=location y={inputs.metric.value} />
