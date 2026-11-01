# Superstore Sales Analysis | SQL & Python

A retail analytics project using SQL and Python to investigate sales, profit, customers, products, and time-based performance.

## Business objective

Create reproducible summaries that help explain where sales and profit are generated and which areas may need closer review.

## Business questions

- How do sales and profit vary by category and region?
- Which products and customers contribute most?
- How does monthly sales performance change?
- What is the overall and category-level profit margin?
- Which transactions have negative profit?

## Tools

SQL (SQLite syntax in the profitability/growth script) · Python · Pandas · NumPy · Matplotlib · Seaborn · Jupyter Notebook

## Repository guide

- `sql/` — reusable analysis queries.
- `13_profitability_and_growth.sql` — profitability and monthly growth examples (see exact path under `sql/`).
- Review the notebook and data folders for the dataset and visualization workflow.

## Run

1. Check the table name and column names in the SQL file.
2. Load the dataset into a SQLite database using the expected schema.
3. Execute the SQL scripts in a SQLite-compatible client.
4. Run the notebook after confirming its data paths and dependencies.

## Metric notes

Profit margin should be calculated as total profit divided by total sales, using the same filtered population. Monthly growth compares a month with the preceding available month; interpret missing prior-month values accordingly.

## Results and limitations

Run the queries against the actual repository dataset before adding numerical findings. Clearly state data filters, date coverage, and any synthetic-data limitations.

## Skills demonstrated

SQL aggregation · CTEs · Window functions · Profitability analysis · Trend analysis · Python visualization

Maintained by [Omkar S. Kshirsagar](https://github.com/osk25-xc).
