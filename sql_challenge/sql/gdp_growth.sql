WITH gdp_growth AS (
    SELECT 
        a.country_code,
        a.gdp_per_capita AS gdp_2011,
        b.gdp_per_capita AS gdp_2012,
        ROUND(((b.gdp_per_capita - a.gdp_per_capita) / a.gdp_per_capita) * 100, 2) AS growth_percentage
    FROM 
        per_capita a
    JOIN 
        per_capita b
    ON 
        a.country_code = b.country_code
    WHERE 
        a.year = 2011 
        AND b.year = 2012
        AND a.gdp_per_capita IS NOT NULL
        AND b.gdp_per_capita IS NOT NULL
)
SELECT 
    country_code,
    growth_percentage
FROM 
    gdp_growth
ORDER BY 
    growth_percentage DESC
LIMIT 10;
