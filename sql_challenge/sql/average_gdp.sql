WITH continent_gdp AS (
  SELECT 
    cm.continent_code,
    pc.gdp_per_capita
  FROM per_capita pc
  JOIN continent_map cm ON pc.country_code = cm.country_code
  WHERE pc.gdp_per_capita IS NOT NULL
    AND pc.year BETWEEN 2004 AND 2012
)
SELECT 
  continent_code,
  ROUND(AVG(gdp_per_capita), 2) AS avg_gdp_per_capita
FROM continent_gdp
GROUP BY continent_code;