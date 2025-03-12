-- The PostgreSQL CASE expression is the same as IF/ELSE statement in other programming languages. It allows you to add if-else logic to the query to form a powerful query.
-- Since CASE is an expression, you can use it in any places where an expression can be used e.g.,SELECT, WHERE, GROUP BY, and HAVING clause.
-- The CASE expression has two forms: general and simple form.
-- 1) General PostgreSQL CASE expression
-- A) A general CASE example
SELECT
    title,
    length,
    CASE
        WHEN length > 0
        AND length <= 50 THEN 'Short'
        WHEN length > 50
        AND length <= 120 THEN 'Medium'
        WHEN length > 120 THEN 'Long'
    END duration
FROM
    film
ORDER BY
    title;

-- B) Using CASE with an aggregate function example
SELECT
    SUM (
        CASE
            WHEN rental_rate = 0.99 THEN 1
            ELSE 0
        END
    ) AS "Economy",
    SUM (
        CASE
            WHEN rental_rate = 2.99 THEN 1
            ELSE 0
        END
    ) AS "Mass",
    SUM (
        CASE
            WHEN rental_rate = 4.99 THEN 1
            ELSE 0
        END
    ) AS "Premium"
FROM
    film;

-- 2) Simple PostgreSQL CASE expression
-- A) Simple PostgreSQL CASE expression example
SELECT
    title,
    rating,
    CASE
        rating
        WHEN 'G' THEN 'General Audiences'
        WHEN 'PG' THEN 'Parental Guidance Suggested'
        WHEN 'PG-13' THEN 'Parents Strongly Cautioned'
        WHEN 'R' THEN 'Restricted'
        WHEN 'NC-17' THEN 'Adults Only'
    END rating_description
FROM
    film
ORDER BY
    title;

-- B) Using simple PostgreSQL CASE expression with aggregate function example
SELECT
    SUM(
        CASE
            rating
            WHEN 'G' THEN 1
            ELSE 0
        END
    ) "General Audiences",
    SUM(
        CASE
            rating
            WHEN 'PG' THEN 1
            ELSE 0
        END
    ) "Parental Guidance Suggested",
    SUM(
        CASE
            rating
            WHEN 'PG-13' THEN 1
            ELSE 0
        END
    ) "Parents Strongly Cautioned",
    SUM(
        CASE
            rating
            WHEN 'R' THEN 1
            ELSE 0
        END
    ) "Restricted",
    SUM(
        CASE
            rating
            WHEN 'NC-17' THEN 1
            ELSE 0
        END
    ) "Adults Only"
FROM
    film;

-- PostgreSQL COALESCE
-- The COALESCE function accepts an unlimited number of arguments. It returns the first argument that is not null. If all arguments are null, the COALESCE function will return null.
SELECT
    COALESCE (NULL, 2, 1);

-- example
SELECT
    product,
    (price - COALESCE(discount, 0)) AS net_price
FROM
    items;

-- PostgreSQL NULLIF function
-- The NULLIF function returns a null value if argument_1 equals to argument_2, otherwise it returns argument_1.
-- NULLIF(argument_1,argument_2);
-- See the following examples:
-- return NULL
SELECT
    NULLIF (1, 1);

-- return 1
SELECT
    NULLIF (1, 0);

-- return A
SELECT
    NULLIF ('A', 'B');

-- exapmle 
SELECT
    id,
    title,
    COALESCE (NULLIF (excerpt, ''), LEFT (body, 40))
FROM
    posts;

-- Using PostgreSQL CAST To Convert a Value of One Type to Another
-- PostgreSQL type cast :: operator
-- Besides the type CAST syntax, you can use the following syntax to convert a value of one type into another:
expression :: type -- See the following example:
SELECT
    '100' :: INTEGER,
    '01-OCT-2015' :: DATE;

--    PostgreSQL CAST examples 
--    1) Cast a string to an integer example
SELECT
    CAST ('100' AS INTEGER);

-- 2) Cast a string to a date example
-- First, we converted 2015-01-01 literal string into January 1st 2015. Second, we converted 01-OCT-2015 to October 1st 2015.
SELECT
    CAST ('2015-01-01' AS DATE),
    CAST ('01-OCT-2015' AS DATE);

-- 3) Cast a string to a double example
SELECT
    CAST ('10.2' AS DOUBLE);

-- 4) Cast a string to a boolean example
SELECT
    CAST('true' AS BOOLEAN),
    CAST('false' as BOOLEAN),
    CAST('T' as BOOLEAN),
    CAST('F' as BOOLEAN);

-- 5) Convert a string to a timestamp example
SELECT
    '2019-06-15 14:30:20' :: timestamp;

-- 6) Convert a string to an interval example
SELECT
    '15 minute' :: interval,
    '2 hour' :: interval,
    '1 day' :: interval,
    '2 week' :: interval,
    '3 month' :: interval;

-- 7) Using CAST with table data example