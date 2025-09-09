# COVID-19 Dashboard

## Deutschland: Inzidenz & Todesrate im Zeitverlauf

```sql germany_data
SELECT date, avg_inzidenz, avg_todesrate
FROM covid1
WHERE location = 'Germany'
ORDER BY date
LIMIT 2500

```

<AreaChart
  data={germany_data}
  title="Inzidenz in Deutschland"
  x=date
  y=avg_inzidenz
/>

