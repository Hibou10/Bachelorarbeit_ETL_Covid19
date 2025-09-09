MODEL (
  name sqlmesh_example.covid_analysis,
  kind FULL
);

SELECT
  country AS location,
  date,
  SUM(new_cases) AS total_cases,
  ROUND(AVG(new_cases_per_million), 2) AS avg_inzidenz,
  SUM(new_deaths) AS total_deaths,
  ROUND(AVG(new_deaths_per_million), 2) AS avg_todesrate,
  MAX(people_fully_vaccinated) AS max_vaccinated
FROM sqlmesh_example.raw_covid_data
WHERE date >= '2020-01-01'
GROUP BY country, date
ORDER BY date;
