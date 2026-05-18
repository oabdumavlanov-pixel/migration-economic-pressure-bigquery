SELECT
  country_name,
  year,
  gdp_per_capita,
  LAG(gdp_per_capita) OVER (
      PARTITION BY country_name
      ORDER BY year
  ) AS previous_gdp,
  
  gdp_per_capita -
  LAG(gdp_per_capita) OVER (
      PARTITION BY country_name
      ORDER BY year
  ) AS gdp_change

FROM world_bank_migration_data;
