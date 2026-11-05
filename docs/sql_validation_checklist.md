# Superstore SQL Validation Checklist

The repository documents SQLite-compatible SQL. Confirm the active database, table name, and column names before executing each query.

## 1. Schema and grain
- [ ] Inspect table definitions and confirm the row grain (order line, order, or another unit).
- [ ] Identify the order identifier and any line-level identifier.
- [ ] Check null keys, duplicate keys, and date coverage.
- [ ] Confirm numeric columns contain valid numeric values.

## 2. Aggregation checks
- [ ] Compare row count with distinct order count.
- [ ] Reconcile category and region subtotals to overall totals.
- [ ] Check whether joins multiply rows before aggregating.
- [ ] Validate negative-profit records and explain the business meaning.

## 3. KPI and time calculations
- [ ] Calculate profit margin as SUM(profit) / SUM(sales) for the same filtered population.
- [ ] Use a safe division expression for zero denominators.
- [ ] For month-over-month growth, compare against the preceding available month and document missing prior periods.
- [ ] Do not replace a missing prior-month value with zero unless the metric definition explicitly requires it.

## 4. Reproducibility
- [ ] Record SQL dialect, filters, date range, and assumptions.
- [ ] Re-run queries after data refresh and compare reconciliations.
- [ ] Keep sample sizes alongside segment-level rates.
- [ ] Add numerical findings only after execution against the current repository data.