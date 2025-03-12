-- After creating a view, you can query data from it as you would from a regular table. Behind the scenes, PostgreSQL will rewrite the query against the view and its defining query, executing it to retrieve data from the base tables.
-- Views do not store data except the materialized views. In PostgreSQL, you can create special views called materialized views that store data physically and periodically refresh it from the base tables.
--
-- Views offer many advantages. Here are some of them:
--      Views help simplify complex queries. Instead of dealing with joins, aggregations, or filtering conditions, you can query from views as if they were regular tables.
--      Typically, you first create views based on complex queries and store them in the database. Then, you can use simple queries based on views instead of using complex queries.
--      Views enable fine-grained control over data access. You can create views that expose subsets of data in the base tables, hiding sensitive information.
--      If your applications use views, you can freely modify the structure of the base tables. In other words, views enable you to create a layer of abstraction over the underlying tables.
--
-- PostgreSQL CREATE VIEW
-- In PostgreSQL, a view is a named query stored in the database server.
CREATE VIEW contact AS
SELECT
    first_name,
    last_name,
    email
FROM
    customer;

-- access view 
SELECT
    *
FROM
    contact;

-- Using the CREATE VIEW statement to create a view based on a complex query
CREATE VIEW customer_info AS
SELECT
    first_name,
    last_name,
    email,
    phone,
    city,
    postal_code,
    country
FROM
    customer
    INNER JOIN address USING (address_id)
    INNER JOIN city USING (city_id)
    INNER JOIN country USING (country_id);

-- Creating a view based on another view
CREATE VIEW customer_usa AS
SELECT
    *
FROM
    customer_info
WHERE
    country = 'United States';

-- To change the defining query of a view, you use the CREATE OR REPLACE VIEW statement:
CREATE
OR REPLACE VIEW contact AS
SELECT
    first_name,
    last_name,
    email,
    phone
FROM
    customer
    INNER JOIN address USING (address_id);

-- Display a view on psql
\ d + contact;

-- Drop View
DROP VIEW comedy_film;

DROP VIEW film_length_stat,
film_category_stat;

-- if there are dependency, it will remove dependency also
DROP VIEW film_info CASCADE;

-- A view is updatable when it meets the following conditions:
--      First, the defining query of the view must have exactly one entry in the FROM clause, which can be a table or another updatable view.
--      Second, the defining query must not contain one of the following clauses at the top level:
--          GROUP BY
--          HAVING
--          LIMIT
--          OFFSET FETCH
--          DISTINCT
--          WITH
--          UNION
--          INTERSECT
--          EXCEPT
--      Third, the selection list of the defining query query must not contain any
--          Window functions
--          Set-returning function
--          Aggregate functions
CREATE VIEW city_us AS
SELECT
    *
FROM
    cities
WHERE
    country = 'US';

-- The ALTER VIEW statement allows you to change various properties of a view.
ALTER VIEW film_type RENAME TO film_rating;

-- Changing the view column
ALTER VIEW film_rating RENAME title TO film_title;

-- Materialized Views
-- PostgreSQL materialized views that store the result of a query physically and refresh the data from base tables periodically.
--
-- Creating materialized views
CREATE MATERIALIZED VIEW rental_by_category AS
SELECT
    c.name AS category,
    sum(p.amount) AS total_sales
FROM
    (
        (
            (
                (
                    (
                        payment p
                        JOIN rental r ON ((p.rental_id = r.rental_id))
                    )
                    JOIN inventory i ON ((r.inventory_id = i.inventory_id))
                )
                JOIN film f ON ((i.film_id = f.film_id))
            )
            JOIN film_category fc ON ((f.film_id = fc.film_id))
        )
        JOIN category c ON ((fc.category_id = c.category_id))
    )
GROUP BY
    c.name
ORDER BY
    sum(p.amount) DESC WITH NO DATA;

-- drop it 
DROP MATERIALIZED VIEW view_name;

-- list views in the current database using the \dv command in psql