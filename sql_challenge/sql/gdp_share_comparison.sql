WITH gdp_2012 AS (
  SELECT cm.continent_code, pc.gdp_per_capita
  FROM per_capita pc
  JOIN continent_map cm ON pc.country_code = cm.country_code
  WHERE pc.year = 2012 AND pc.gdp_per_capita IS NOT NULL
),
continent_gdp AS (
  SELECT 
    CASE 
      WHEN continent_code IN ('EU', 'NA') THEN continent_code 
      ELSE 'OT' 
    END AS continent_group,
    SUM(gdp_per_capita) AS total_gdp
  FROM gdp_2012
  GROUP BY 
    continent_group
),
global_gdp AS (
  SELECT SUM(total_gdp) AS global_total
  FROM continent_gdp
)
SELECT 
  cg.continent_group,
  cg.total_gdp,
  ROUND((cg.total_gdp / g.global_total) * 100, 2) AS gdp_percentage_share
FROM continent_gdp cg, global_gdp g
ORDER BY gdp_percentage_share DESC;