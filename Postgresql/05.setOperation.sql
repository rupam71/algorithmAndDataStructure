-- PostgreSQL UNION operator to combine result sets of multiple queries into a single result set.
-- The UNION operator allows you to combine the result sets of two or more SELECT statements into a single result set.
SELECT
    select_list
FROM
    A
UNION
SELECT
    select_list
FROM
    B
ORDER BY
    sort_expression;

-- the queries must conform to the following rules:
-- The number and the order of the columns in the select list of both queries must be the same.
-- The data types of the columns in the select lists must be compatible.
-- The UNION operator removes all duplicate rows from the combined data set. To retain the duplicate rows, you use the the UNION ALL instead.
-- Use the UNION to combine result sets of two queries and return distinct rows.
-- Use the UNION ALL to combine the result sets of two queries but retain the duplicate rows.
-- a = {1,2,3,4} b = {3,4,5,6} EXCEPT = {1,2,3,4,5,6}
SELECT
    *
FROM
    top_rated_films
UNION
ALL
SELECT
    *
FROM
    most_popular_films
ORDER BY
    title;

-- Like the UNION and EXCEPT operators, the PostgreSQL INTERSECT operator combines result sets of two SELECT statements into a single result set. The INTERSECT operator returns a result set containing rows that are available in both result sets.
-- all common column in both query will re result
-- a = {1,2,3,4} b = {3,4,5,6} EXCEPT = {3,4}
SELECT
    *
FROM
    most_popular_films
INTERSECT
SELECT
    *
FROM
    top_rated_films
ORDER BY
    release_year;

-- The EXCEPT operator returns distinct rows from the first (left) query that are not in the second (right) query.
-- it will send result of first expresion which are not common from second expression.
-- a = {1,2,3,4} b = {3,4,5,6} EXCEPT = {1,2}
SELECT
    *
FROM
    top_rated_films
EXCEPT
SELECT
    *
FROM
    most_popular_films
ORDER BY
    title;