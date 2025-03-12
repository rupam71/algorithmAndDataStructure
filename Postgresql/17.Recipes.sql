-- Postgresql Explain
-- return query log
-- first line should be 'Explain'
EXPLAIN [ ( option [, ...]
) ] sql_statement;

-- ANALYZE [ boolean ]
-- VERBOSE [ boolean ]
-- COSTS [ boolean ]
-- BUFFERS [ boolean ]
-- TIMING [ boolean ]  
-- SUMMARY [ boolean ]
-- FORMAT { TEXT | XML | JSON | YAML }
-- Deleting duplicate rows using DELETE USING statement
DELETE FROM
    basket a USING basket b
WHERE
    a.id < b.id
    AND a.fruit = b.fruit;

-- Generate a Random Number in a Range
SELECT
    random();

-- To generate a random number between 1 and 11, you use the following statement:
SELECT
    random() * 10 + 1 AS RAND_1_11;

SELECT
    floor(random() * (h - l + 1) + l) :: int;

-- PostgreSQL vs. MySQL
-- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-vs-mysql/
--
-- Practical psql Commands You Don’t Want to Miss
-- https://www.postgresqltutorial.com/postgresql-administration/psql-commands/