# sql-retail-sales-analysis
Retail sales analysis project using SQL Server, focusing on trends, profitability, and customer behavior.
## Key Insights

Revenue concentration:
A relatively small portion of customers contributes a large share of total revenue.  
Based on the analysis, Big Spenders and Loyal customers together account for around **61.53% of total sales**, showing that revenue is heavily driven by higher-value customers.

Product profitability gap: 
Some subcategories generate strong sales volume but consistently deliver low or negative profit.  
This indicates that heavy discounting is reducing margins and that higher sales do not always lead to higher profitability.

Customer loyalty impact: 
Customers who place repeat orders tend to have a higher average order value than one-time buyers.  
This suggests that retaining existing customers is more effective than focusing solely on new customer acquisition.

Seasonal sales pattern: 
Sales and profit fluctuate across the year, with clear peaks observed in November and December.  
This points to seasonal demand patterns that should be considered when planning promotions and inventory.

RFM segmentation insight:
The Loyal and Big Spenders segments represent a smaller share of the customer base but contribute a large proportion of total revenue.  
In contrast, the At Risk segment includes customers who previously purchased frequently but have not returned recently, indicating potential churn.

| Segment       | Customers | Total Sales |
|--------------|-----------|-------------|
| Big Spenders | 180       | 923,030.32  |
| Loyal        | 92        | 490,434.22  |
| Others       | 250       | 409,876.42  |
| New          | 181       | 308,168.17  |
| At Risk      | 90        | 165,691.73  |

## Recommendations

Review discount levels for high-sales but unprofitable subcategories to improve overall margins.

Prioritize retention initiatives targeting Loyal and Big Spenders, as these segments deliver the highest revenue per customer.

Design targeted re-engagement strategies for At Risk customers to reduce potential churn.

Use seasonal sales patterns to better plan inventory, staffing, and promotion timing.
