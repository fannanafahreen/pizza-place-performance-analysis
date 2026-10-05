-- ============================================================
-- STAGING: Pizza Place Sales dataset
-- All four raw tables passed data quality checks with no real
-- issues found (see docs/data_quality_report.csv). These staging
-- tables mainly convert text-stored numbers into real number types.
-- ============================================================
use restaurant360_raw;

DROP TABLE IF EXISTS stg_pizza_orders;

CREATE TABLE stg_pizza_orders AS
SELECT order_id, date, time
FROM pizza_orders;


DROP TABLE IF EXISTS stg_pizza_order_details;

CREATE TABLE stg_pizza_order_details AS
SELECT order_details_id, order_id, pizza_id, quantity + 0 AS quantity
FROM pizza_order_details;


DROP TABLE IF EXISTS stg_pizzas;

CREATE TABLE stg_pizzas AS
SELECT pizza_id, pizza_type_id, size, price + 0 AS price
FROM pizzas;


DROP TABLE IF EXISTS stg_pizza_types;

CREATE TABLE stg_pizza_types AS
SELECT pizza_type_id, name, category, ingredients
FROM pizza_types;

-- Verification: row counts should exactly match the raw tables
-- SELECT COUNT(*) FROM stg_pizza_orders;         -- 21350
-- SELECT COUNT(*) FROM stg_pizza_order_details;  -- 48620
-- SELECT COUNT(*) FROM stg_pizzas;               -- 96
-- SELECT COUNT(*) FROM stg_pizza_types;          -- 32