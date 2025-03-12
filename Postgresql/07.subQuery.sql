-- A subquery is a query nested within another query. A subquery is also known as an inner query or nested query.
-- the subquery is enclosed within parentheses and is executed first
-- PostgreSQL executes the subquery first to get the country id and uses that country id for the WHERE clause to retrieve the cities.
SELECT
    city
FROM
    city
WHERE
    country_id = (
        SELECT
            country_id
        FROM
            country
        WHERE
            country = 'United States'
    )
ORDER BY
    city;

-- A subquery can return zero or more rows. If the query returns more than one row, you can use it with the IN operator. For example:
SELECT
    film_id,
    title
FROM
    film
WHERE
    film_id IN (
        SELECT
            film_id
        FROM
            film_category
            INNER JOIN category USING(category_id)
        WHERE
            name = 'Action'
    )
ORDER BY
    film_id;

-- Unlike a regular subquery, PostgreSQL evaluates the correlated subquery once for each row processed by the outer query.
-- Since PostgreSQL reevaluates the correlated subquery for every row in the outer query, this may lead to performance issues, especially when dealing with large datasets.
-- A correlated subquery can be useful when you need to perform a query that depends on the values of the current being processed.
SELECT
    film_id,
    title,
    length,
    rating
FROM
    film f
WHERE
    length > (
        SELECT
            AVG(length)
        FROM
            film
        WHERE
            rating = f.rating
    );

-- How it works.
--     The outer query retrieves id, title, length, and rating from the film table that has the alias f:
--     For each row processed by the outer query, the correlated subquery calculates the average length of films that have the same rating as the current row (f.rating).
--     The WHERE clause (WHERE length > (...)) checks if the length of the current film is greater than the average.
--     The correlated subquery calculates the average length for films with the same rating as the current row in the outer query:
--     The WHERE clause ensures that the correlated subquery considers only films with the same rating as the current row in the outer query. The condition rating = f.rating creates the correlation.
--     As a result, the outer query returns rows where the length of the film is greater than the average length for films with the same rating.
-- The PostgreSQL ANY operator compares a value with a set of values returned by a subquery. It is commonly used in combination with comparison operators such as =, <, >, <=, >=, and <>.
SELECT
    *
FROM
    employees
WHERE
    salary < ANY (
        SELECT
            salary
        FROM
            employees
    );

-- any employee salary lower than any manager  salary. any.
-- heightst salary of manager table . 
-- If the subquery returns a non-empty result set, the ALL operator works as follows:
--     value > ALL (subquery) returns true if the value is greater than the biggest value returned by the subquery.
--     value >= ALL (subquery) returns true if the value is greater than or equal to the biggest value returned by the subquery.
--     value < ALL (subquery) returns true if the value is less than the smallest value returned by the subquery.
--     value <= ALL (subquery) returns true if the value is less than or equal to the smallest value returned by the subquery.
--     value = ALL (subquery) returns true if the value is equal to every value returned by the subquery.
--     value != ALL (subquery) returns true if the value is not equal to any value returned by the subquery.
SELECT
    *
FROM
    employees
WHERE
    salary < ALL(
        select
            salary
        from
            managers
    )
ORDER BY
    salary DESC;

-- It returns all the employees whose salaries are less than the lowest salary of all managers which is 55K.
-- The result of EXISTS operator depends on whether any row is returned by the subquery, and not on the row contents. Therefore, columns that appear in the select_list of the subquery are not important.
-- The NOT EXISTS operator returns true if the subquery returns no row or false if the subquery returns at least one row.
SELECT
    first_name,
    last_name
FROM
    customer c
WHERE
    EXISTS (
        SELECT
            1
        FROM
            payment p
        WHERE
            p.customer_id = c.customer_id
            AND amount > 11
    )
ORDER BY
    first_name,
    last_name;

-- In this example, for each customer in the customer table, the subquery checks the payment table to find if that customer made at least one payment (p.customer_id = c.customer_id) and the amount is greater than 11 ( amount > 11)
-- The following example uses the NOT EXISTS operator to find customers who have not made any payment that is more than 11.
SELECT
    first_name,
    last_name
FROM
    customer c
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            payment p
        WHERE
            p.customer_id = c.customer_id
            AND amount > 11
    )
ORDER BY
    first_name,
    last_name;