import pandas as pd
import psycopg2

# Database connection
conn = psycopg2.connect(
    host="localhost",
    database="postgres",
    user="postgres",
    password="YOUR_POSTGRES_PASSWORD"
)

query = """
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
"""

# Run query and load into pandas
df = pd.read_sql(query, conn)

# Export dataset used for Power BI
df.to_csv("london_vs_rest_prices.csv", index=False)

conn.close()

print("Dataset exported successfully.")
