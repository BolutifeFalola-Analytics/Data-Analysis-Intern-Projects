"""
Basic Python Data Analysis Script
Author: Boluwatife Falola

Description:
This script demonstrates foundational Python data analysis skills
using pandas. It focuses on loading data, cleaning it, and
extracting simple insights.
"""

import pandas as pd

# Sample dataset created for practice
data = {
    "product": ["A", "B", "C", "A", "B"],
    "category": ["Electronics", "Furniture", "Electronics", "Electronics", "Furniture"],
    "quantity": [10, 5, 8, 12, 7],
    "unit_price": [100, 200, 150, 100, 200]
}

# Create DataFrame
df = pd.DataFrame(data)

# Calculate total sales
df["total_sales"] = df["quantity"] * df["unit_price"]

# View dataset
print(df)

# Total sales by category
sales_by_category = df.groupby("category")["total_sales"].sum()
print("\nTotal Sales by Category:")
print(sales_by_category)

# Average sales per product
average_sales = df.groupby("product")["total_sales"].mean()
print("\nAverage Sales per Product:")
print(average_sales)
