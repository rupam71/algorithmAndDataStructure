-- PostgreSQL evaluates the GROUP BY clause after the FROM and WHERE clauses and before the HAVING SELECT, DISTINCT, ORDER BY and LIMIT clauses.
-- FROM > WHERE > GROUP BY > HAVING > SELECT > DISTINCT > ORDER BY > LIMIT

SELECT 
  customer_id, 
  staff_id, 
  SUM(amount) 
FROM 
  payment 
GROUP BY 
  staff_id, 
  customer_id 
ORDER BY 
  customer_id;

-- Group By with join
SELECT 
  first_name || ' ' || last_name full_name, 
  SUM (amount) amount 
FROM 
  payment 
  INNER JOIN customer USING (customer_id) 
GROUP BY 
  full_name 
ORDER BY 
  amount DESC;

-- with date 
-- Since the payment_date is a timestamp column, we convert it to a date using the DATE() function and group the payments by the date.
SELECT 
  DATE(payment_date) payment_date, 
  SUM(amount) sum 
FROM 
  payment 
GROUP BY 
  DATE(payment_date) 
ORDER BY 
  payment_date DESC;


-- Because PostgreSQL evaluates the HAVING clause before the SELECT clause, you cannot use the column aliases in the HAVING clause.
-- The WHERE clause filters the rows based on a specified condition whereas the HAVING clause filter groups of rows according to a specified condition.
SELECT 
  customer_id, 
  SUM (amount) amount 
FROM 
  payment 
GROUP BY 
  customer_id 
HAVING 
  SUM (amount) > 200 
ORDER BY 
  amount DESC;










