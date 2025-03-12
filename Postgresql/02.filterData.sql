-- The WHERE clause uses the condition to filter the rows returned from the SELECT clause.
-- PostgreSQL evaluates the WHERE clause after the FROM clause but before the SELECT and ORDER BY clause:
-- FROM > WHERE > SELECT > ORDER BY 
-- If you use column aliases in the SELECT clause, you cannot use them in the WHERE clause.
-- Operator	    Description
-- =	        Equal
-- >	        Greater than
-- <	        Less than
-- >=	        Greater than or equal
-- <=	        Less than or equal
-- <> or !=	    Not equal
-- AND	        Logical operator AND
-- OR	        Logical operator OR
-- IN	        Return true if a value matches any value in a list
-- BETWEEN	    Return true if a value is between a range of values
-- LIKE	        Return true if a value matches a pattern
-- IS NULL	    Return true if a value is NULL
-- NOT	        Negate the result of other operators
SELECT
    first_name,
    last_name
FROM
    customer
WHERE
    last_name = 'Rodriguez'
    OR first_name = 'Adam';

-- If you want to find a value in a list of values, you can use the IN operator.
WHERE
    first_name IN ('Ann', 'Anne', 'Annie');

-- PostgreSQL NOT IN operator
value NOT IN (value1, value2,...); 
-- The NOT IN operator returns true if the value is not equal to any value in the list such as value1 and value2; otherwise, the NOT IN operator returns false.
-- To find a string that matches a specified pattern, you use the LIKE operator.
WHERE
    first_name LIKE 'Ann%';

-- The % is called a wildcard that matches any string. The 'Ann%' pattern matches any strings that start with 'Ann'.
-- The following example finds customers whose first names start with the letter A and contains 3 to 5 characters by using the BETWEEN operator.
-- The BETWEEN operator returns true if a value is in a range of values.
SELECT
    first_name,
    LENGTH(first_name) name_length
FROM
    customer
WHERE
    first_name LIKE 'A%'
    AND LENGTH(first_name) BETWEEN 3
    AND 5
ORDER BY
    name_length;

-- value BETWEEN low AND high;
-- value NOT BETWEEN low AND high; 

-- Using the WHERE clause with the not equal operator (<>) example
-- This example finds customers whose first names start with Bra and last names are not Motley:
SELECT
    first_name,
    last_name
FROM
    customer
WHERE
    first_name LIKE 'Bra%'
    AND last_name <> 'Motley';

-- In PostgreSQL, a boolean value can have one of three values: true, false, and null.
-- PostgreSQL uses true, 't', 'true', 'y', 'yes', '1' to represent true and false, 'f', 'false', 'n', 'no', and '0' to represent false.
SELECT
    1 = 1 AS result;

SELECT
    true
    AND true AS result;

-- If you want to skip a number of rows before returning the row_count rows, you can use OFFSET clause placed after the LIMIT clause as shown in the following statement:
SELECT
    select_list
FROM
    table_name
ORDER BY
    sort_expression
LIMIT
    row_count OFFSET row_to_skip;

-- The FETCH clause is functionally equivalent to the LIMIT clause. If you plan to make your application compatible with other database systems, you should use the FETCH clause because it follows the standard SQL.
SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title OFFSET 5 ROWS
FETCH FIRST
    5 ROW ONLY;

-- PostgreSQL offers two wildcards:
--     Percent sign ( %) matches any sequence of zero or more characters.
--     Underscore sign (_)  matches any single character.
--     aa% means start with aa, %aa means end with aa and %aa% is contain with aa.
--     NOT LIKE is opposit of LIKE
--     ILIKE is case insensitive pattern
--     NOT ILIKE is opposit of ILIKE
-- Using the LIKE operator a pattern that contains both wildcards
-- The following example uses the LIKE operator with a pattern that contains both the percent ( %) and underscore (_) wildcards:
SELECT
    first_name,
    last_name,
    middle_name
FROM
    customer
WHERE
    first_name LIKE '_her%'
    OR last_name ILIKE 'BAR%'
    OR middle_name NOT LIKE 'Jen%'
ORDER BY
    first_name;

-- PostgreSQL also provides some operators that mirror the functionality of LIKE, NOT LIKE, ILIKE, NOT ILIKE, as shown in the following table:
--      Operator	Equivalent
--      ~~	        LIKE
--      ~~*	        ILIKE
--      !~~	        NOT LIKE
--      !~~*	    NOT ILIKE
-- PostgreSQL LIKE operator with ESCAPE option
WHERE
    message LIKE '%10$%%' ESCAPE '$';

-- match 10% here.
-- IS NULL operator
value IS NULL -- To negate the IS NULL operator, you use the IS NOT NULL operator:
value IS NOT NULL
SELECT
    address,
    street
FROM
    address
WHERE
    address IS NULL
    AND street IS NOT NULL;