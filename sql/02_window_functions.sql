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

#row numbers
SELECT employee, department, salary
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS rn
    FROM employees
) t
WHERE rn = 1;

🔹 2. RANK vs DENSE_RANK
Question:

Rank employees by salary.

SELECT employee,
       salary,
       RANK() OVER (ORDER BY salary DESC) AS rnk,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rnk
FROM employees;

🔹 3. Running Total
Question:

Calculate cumulative sales.

SELECT order_date,
       sales,
       SUM(sales) OVER (
           ORDER BY order_date
       ) AS running_total
FROM orders;

🔹 4. LAG()
Question:

Compare today's sales with yesterday's.

SELECT order_date,
       sales,
       LAG(sales) OVER (
           ORDER BY order_date
       ) AS previous_day_sales
FROM orders;

🔹 5. LEAD()
Question:

Find next month's revenue.

SELECT month,
       revenue,
       LEAD(revenue) OVER (
           ORDER BY month
       ) AS next_month_revenue
FROM revenue_table;
