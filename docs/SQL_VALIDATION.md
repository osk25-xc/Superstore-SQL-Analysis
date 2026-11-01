# SQL Validation Notes

## What was tested

The queries in `sql/13_profitability_and_growth.sql` were smoke-tested using SQLite against a small, temporary four-row fixture. The test covers:
- Aggregated profit margin
- Monthly sales/profit with `LAG()` month-over-month growth
- Identification of negative-profit rows

The fixture and reproducible test queries are in `sql/14_validation_smoke_test.sql`.

## Smoke-test output

| Check | Expected result |
|---|---:|
| Total profit | 100.00 |
| Total sales | 750.00 |
| Overall profit margin | 13.33% |
| January 2025 sales | 300.00 |
| February 2025 sales growth | -50.00% |
| March 2025 sales growth | 100.00% |
| Negative-profit rows | 1 |

## Important limitation

This validates SQL syntax and calculation behavior on a controlled fixture only. It does **not** validate the queries against the full Superstore source dataset or prove that the repository's actual table schema matches every referenced column. Run the queries against the real project database and reconcile totals before publishing business findings.

## Run

Open `sql/14_validation_smoke_test.sql` in a SQLite-compatible SQL editor and execute it in a scratch database. The script drops and recreates a table named `sales`, then drops it at the end; do not run it in a database containing a table you need to preserve.
