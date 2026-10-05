-- ==========================================================
-- CHECK 1: Duplicate customer_id from Cafe's customers table
-- ==========================================================
use restaurant360_raw;
select customer_id, count(*) as time_seen
from customers
group by customer_id
having count(*) > 1;  -- No dupliate Customer Id

-- ==================================
-- CHECK 2: How many Gender are there
-- ==================================
select gender, count(*) as how_many
from customers
group by gender;

-- ==========================
-- CHECK 3: Check Unreal age
-- ==========================
-- CHECK 3.1: Check age range
-- ===========================
select min(age) as youngest,
       max(age) as oldes,
       avg(age) as average
from customers; -- 1st attept: wrong answer given youngest= 100 oldest = 99 ; it is because the value is in text format.
-- =============================================
-- CHECK 3.1(fixted): Convert age text to number
-- =============================================
select 
      min(cast(age as UNSIGNED)) as youngest ,
      max(cast(age as unsigned)) as oldest ,
      avg(cast(age as unsigned)) as average
from customers
where age is not null and age != '';

-- =========================================
-- CHECK 3.2: Chceck the count of age group
-- =========================================
select age + 0 as age, count(*) as count
from customers
where age+ 0 is not null and age != ''
group by age+ 0
order by age+ 0 desc
limit 15;

-- ==========================================================
-- CHECK 4: Are all became_member_on values exactly 8 digits?
-- ==========================================================
SELECT became_member_on
FROM customers
WHERE became_member_on NOT REGEXP '^[0-9]{8}$';

-- ============================
-- CHECK 5 (correct version): Missing income, both NULL and empty text
-- ============================
SELECT COUNT(*) AS missing_income
FROM customers
WHERE income IS NULL OR income = '';

-- ============================
-- CHECK 5b: Does missing income match age=118?
-- ============================
select count(*) as missing_income_at_age118
from customers
where (income is null or income = '') 
and age + 0 = 118;

-- ============================
-- CHECK 5c: For every age, how many rows also have missing income?
-- ============================
select age + 0 as age_group , count(*) , sum(case when income is null or income = '' then 1 else 0 end) as missing_income_count
from customers
where age is not null and age != ''
group by age_group
order by age_group desc;

-- ============================
-- CHECK 1(Event): Do all customer_id values in events actually exist in customers?
-- ============================
SELECT COUNT(*) AS orphaned_events
FROM events
WHERE customer_id NOT IN (
    SELECT customer_id FROM customers
); -- no

-- ===============================================
-- CHECK 2(Event): Do the table has duplicate rows
-- ===============================================
select count(*)
from (select customer_id,event,value,time, Count(*) as time_seen
from events
group by customer_id,event,value,time
having time_seen > 1) as dupes; -- 396 duplicate rows

-- ===============================================
-- CHECK 3(Event): What does 'value' look like for transaction events?
-- ===============================================
select event, value from events where event = 'transaction'; -- value count = 138953

-- ===============================================
-- CHECK 1(pizza): Pizza Order id duplicate check
-- ===============================================
select order_details_id , count(*) as count from pizza_order_details
group by order_details_id
having count>1; -- n0 duplicates

-- ================================================================
-- CHECK 2(pizza): Does all other Id of order details are in order?
-- ================================================================
select count(*) from pizza_order_details
where order_id not in (select order_id from pizza_orders);

-- ================================================================
-- CHECK 3(pizza): Does every pizza_id actually exist in pizzas?
-- ================================================================
select count(*) from pizza_order_details
where order_id not in (select order_id from pizzas);

-- ================================================================
-- CHECK 4(pizza): check the date and time columns look valid
-- ================================================================
SELECT MIN(date) AS earliest, MAX(date) AS latest
FROM pizza_orders;

-- ================================================================
-- CHECK 1(pizza): check pizza type duplication
-- ================================================================
select pizza_type_id, count(*) as count from pizza_types group by pizza_type_id having count>1; -- no duplicates
-- ============================================
-- CHECK 2(pizza): check pizza name duplication
-- ============================================
select name, count(*) as count from pizza_types group by name having count>1; -- no duplicates
-- ============================================
-- CHECK 3(pizza): check pizza type duplication
-- ============================================
select pizza_id, count(*) as count from pizzas group by pizza_id having count > 1 ;

-- =======================================================================
-- CHECK 4(pizza): Does every pizza_type_id actually exist in pizza_types?
-- =======================================================================
select count(*) from pizzas where pizza_type_id not in (select pizza_type_id from pizza_types);

-- ===========================================================================
-- CHECK 5(pizza): Does price ever look wrong (negative, zero, or oddly huge)?
-- ===========================================================================
SELECT MIN(price+0) AS min_price, MAX(price+0) AS max_price
FROM pizzas;

-- ============================================
-- CHECK 1(restaurant): Check duplicate item_id
-- ============================================
select ï»¿menu_item_id , count(*) as count from restaurant_menu_items group by ï»¿menu_item_id having count > 1;

-- ============================================
-- CHECK 2(restaurant): Check menu_item_id exist in the menu_items table
-- ============================================
SELECT COUNT(*) AS orphaned_items
FROM restaurant_order_details
WHERE item_id NOT IN (SELECT ï»¿menu_item_id FROM restaurant_menu_items);

-- ============================================
-- CHECK 1(Market_data): Check Market table
-- ============================================
SELECT ID, Year_Birth, Education, Marital_Status, Income, Kidhome, Teenhome, Country
FROM marketing_data
LIMIT 10;

-- ============================
-- CHECK 2(Market_data): How many rows have these joke marital status values?
-- ============================
select Marital_Status, count(*) as count from marketing_data where Marital_Status in ('YOLO' , 'Absurd' , 'together', 'Alone') group by Marital_Status;

-- =========================================
-- CHECK 3 (Market_data): duplicate ID check
-- =========================================
select ID , count(*) as count from marketing_data group by ID having count > 1; -- No dupplicates

