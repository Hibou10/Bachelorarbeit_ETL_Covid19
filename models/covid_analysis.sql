MODEL (
  name sqlmesh_example.covid_analysis,
  kind FULL
);

SELECT
  country,
  EXTRACT(YEAR FROM date) AS year,
  SUM(COALESCE(new_cases,0)) AS infections,
  ROUND(AVG(COALESCE(new_cases_per_million,0)),2) AS incidence,
  SUM(COALESCE(new_deaths,0)) AS deaths,
  MAX(COALESCE(people_fully_vaccinated,0)) AS vaccinations
FROM sqlmesh_example.raw_covid_data
WHERE date >= '2020-01-01'
GROUP BY country, year
ORDER BY year;