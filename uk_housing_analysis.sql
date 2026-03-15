-- ==========================================
-- UK Housing Market Analysis
-- Data Source: UK Land Registry Price Paid
-- ==========================================


-- 1. Average UK property price by year

SELECT 
    EXTRACT(YEAR FROM date_of_transfer) AS year,
    AVG(price) AS avg_price
FROM property_transactions
GROUP BY year
ORDER BY year;



-- 2. Average property price by county in 2022

SELECT 
    county,
    AVG(price) AS avg_price_2022
FROM property_transactions
WHERE EXTRACT(YEAR FROM date_of_transfer) = 2022
GROUP BY county
ORDER BY avg_price_2022 DESC
LIMIT 10;



-- 3. Price growth comparison (2012–2022)

WITH prices AS (
    SELECT 
        county,
        EXTRACT(YEAR FROM date_of_transfer) AS year,
        AVG(price) AS avg_price
    FROM property_transactions
    WHERE date_of_transfer >= '2012-01-01'
      AND date_of_transfer < '2023-01-01'
    GROUP BY county, year
)

SELECT 
    county,
    MAX(CASE WHEN year = 2012 THEN avg_price END) AS price_2012,
    MAX(CASE WHEN year = 2022 THEN avg_price END) AS price_2022,
    ROUND(
        (
            MAX(CASE WHEN year = 2022 THEN avg_price END)
            /
            MAX(CASE WHEN year = 2012 THEN avg_price END)
            - 1
        ) * 100, 2
    ) AS growth_percent
FROM prices
GROUP BY county
ORDER BY growth_percent DESC;



-- 4. London vs Rest of UK comparison dataset

SELECT
    EXTRACT(YEAR FROM date_of_transfer) AS year,
    CASE 
        WHEN county = 'GREATER LONDON' THEN 'Greater London'
        ELSE 'Rest of UK'
    END AS region_group,
    AVG(price) AS avg_price,
    COUNT(*) AS transactions
FROM property_transactions
WHERE date_of_transfer >= '1995-01-01'
  AND date_of_transfer < '2023-01-01'
GROUP BY year, region_group
ORDER BY year, region_group;
