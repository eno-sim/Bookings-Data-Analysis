WITH continent_gdp AS (
  SELECT 
    cm.continent_code,
    pc.gdp_per_capita
  FROM per_capita pc
  JOIN continent_map cm ON pc.country_code = cm.country_code
  WHERE pc.gdp_per_capita IS NOT NULL
    AND pc.year BETWEEN 2004 AND 2012
)
SELECT DISTINCT
  continent_code,
  CAST(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY gdp_per_capita) AS NUMERIC(10,2)) AS median_gdp_per_capita
FROM continent_gdp
GROUP BY continent_code;