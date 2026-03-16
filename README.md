# UK-Housing-Market-Analysis
UK Housing Market Analysis (PostgreSQL, SQL, Power BI). 
Analysed 28M+ UK property transactions (1995–2023) to 
find long-term trends in the housing market.

The analysis focuses on structural differences between
Greater London and the rest of the UK housing market.

*The SQL scripts used for the analysis are available in uk_housing_analysis.sql*.


## Key Findings
- Between 1995–2016, Greater London prices grew at 9.8% annually,
  significantly outperforming the rest of the UK (7.0%).

- After 2016, London experienced a sharp slowdown (2.9% CAGR),
  while regional markets remained stronger (4.5%).

- This suggests a structural shift in the housing market,
  with regional markets narrowing the price growth gap.

## Dashboard
<img width="1241" height="728" alt="image" src="https://github.com/user-attachments/assets/27dca963-cc19-4851-ab54-73d8f61b2c46" />

## Tools Used
- SQL (PostgreSQL)
- Power BI
- Python (data preparation)

## Pipeline
The dataset used for the Power BI dashboard is generated using a Python
script that queries the PostgreSQL database and exports the aggregated
data as a CSV file.

**Script location**: scripts/export_data.py

## Database
- UK Property Price Dataset
- ~28 million property transactions
- 1995–2023

**Link**: https://www.kaggle.com/datasets/willianoliveiragibin/uk-property-price-data-1995-2023-04
