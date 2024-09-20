SELECT 
    COALESCE(country_code, 'N/A') AS country_code
FROM 
    continent_map
GROUP BY 
    country_code
HAVING 
    COUNT(country_code) > 1 OR country_code IS NULL
ORDER BY 
    country_code = 'N/A' DESC, 
    country_code ASC;
