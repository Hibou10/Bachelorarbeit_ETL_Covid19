MODEL (
  name sqlmesh_example.raw_covid_data,
  kind FULL
);

SELECT
  country,
  TRY_CAST(NULLIF(date, '') AS DATE) AS date,
  TRY_CAST(NULLIF(total_cases, '') AS DOUBLE) AS total_cases,
  TRY_CAST(NULLIF(new_cases, '') AS DOUBLE) AS new_cases,
  TRY_CAST(NULLIF(new_cases_per_million, '') AS DOUBLE) AS new_cases_per_million,
  TRY_CAST(NULLIF(new_deaths, '') AS DOUBLE) AS new_deaths,
  TRY_CAST(NULLIF(new_deaths_per_million, '') AS DOUBLE) AS new_deaths_per_million,
  TRY_CAST(NULLIF(people_vaccinated, '') AS DOUBLE) AS people_vaccinated,
  TRY_CAST(NULLIF(people_fully_vaccinated, '') AS DOUBLE) AS people_fully_vaccinated,
  TRY_CAST(NULLIF(total_boosters, '') AS DOUBLE) AS total_boosters
FROM read_csv_auto(
  'Data/OWID_COVID19_DATA.csv',
  HEADER=TRUE,
  ALL_VARCHAR=TRUE
)
WHERE TRY_CAST(NULLIF(date, '') AS DATE) IS NOT NULL;
