# Superstore SQL Validation Notes

## Dataset grain
Confirm whether each record is a product line within an order. Do not use row count as order count when an order can contain multiple lines.

## Metric definitions
- Sales and profit: sum the corresponding fields after applying consistent filters.
- Order count: distinct order identifiers.
- Profit margin: total profit divided by total sales.
- Monthly growth: current month sales compared with the previous available month; decide how to represent missing months.

## SQL checks
Validate date parsing, NULL handling, negative profit records, duplicate identifiers, and join cardinality. Confirm SQL dialect compatibility before running window functions or date expressions.

## Output review
Reconcile category and regional subtotals to grand totals. Include the filter period and denominator in any published result. Avoid hardcoding findings before query execution.
