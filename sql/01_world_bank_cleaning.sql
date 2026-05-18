SELECT
  country_name,
  country_code,
  year,
  gdp_per_capita,
  population_growth,
  unemployment_rate,
  net_migration
FROM world_bank_migration_data
WHERE year >= 2010
ORDER BY country_name, year;
