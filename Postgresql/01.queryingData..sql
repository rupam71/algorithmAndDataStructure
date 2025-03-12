-- SELECT 
SELECT
   first_name || ' ' || last_name AS fullName,
   email
FROM
   customer;

-- If a column alias contains one or more spaces, you need to surround it with double quotes like this:
SELECT
   column_name AS "column alias"
FROM
   customer;

-- we use the NOW() function in the SELECT statement. It’ll return the current date and time of the PostgreSQL server.
SELECT
   NOW();

-- If you omit the ASC or DESC option, the ORDER BY uses ASC by default. ASC (0-9) and DESC (9-0)
-- PostgreSQL evaluates the clauses in the SELECT statement in the following order: FROM, SELECT, and ORDER BY
--  if you have a column alias in the SELECT clause, you can use it in the ORDER BY clause.
-- For multiple column, first column happen first. than for first column, second column will sort.
SELECT
   first_name,
   last_name
FROM
   customer
ORDER BY
   first_name ASC,
   last_name DESC;

--Using PostgreSQL ORDER BY clause to sort rows by expressions
SELECT
   first_name,
   LENGTH(first_name) len
FROM
   customer
ORDER BY
   len DESC;

-- When you sort rows that contain NULL, you can specify the order of NULL with other non-null values by using the NULLS FIRST or NULLS LAST option of the ORDER BY clause:
ORDER BY
   sort_expresssion [ASC | DESC] [NULLS FIRST | NULLS LAST] -- The output indicates that the ORDER BY clause with the DESC option uses the NULLS FIRST by default.
   -- The output indicates that the ORDER BY clause with the ASC option uses the NULLS LAST by default.
   -- SELECT DISTINCT clause to remove duplicate rows from a result set returned by a query.
   -- The SELECT DISTINCT clause can be applied to one or more columns in the select list of the SELECT statement.
   -- If you specify multiple columns, the SELECT DISTINCT clause will evaluate the duplicate based on the combination of values in these columns. 
SELECT
   DISTINCT column1,
   column2
FROM
   table_name;