-- POSTGRESQL DATA TYPE
-- A Boolean data type can hold one of three possible values: true, false, or null. 
-- PostgreSQL provides three character data types: CHAR(n), VARCHAR(n), and TEXT
--      CHAR(n) is the fixed-length character with space padded. If you insert a string that is shorter than the length of the column, PostgreSQL pads spaces. If you insert a string that is longer than the length of the column, PostgreSQL will issue an error.
--      VARCHAR(n) is the variable-length character string. The VARCHAR(n) allows you to store up to n characters. PostgreSQL does not pad spaces when the stored string is shorter than the length of the column.
--      TEXT is the variable-length character string. Theoretically, text data is a character string with unlimited length.
-- There are three kinds of integers in PostgreSQL:
--      Small integer ( SMALLINT) is a 2-byte signed integer that has a range from -32,768 to 32,767.
--      Integer ( INT) is a 4-byte integer that has a range from -2,147,483,648 to 2,147,483,647.
--      Serial is the same as integer except that PostgreSQL will automatically generate and populate values into the SERIAL column. This is similar to AUTO_INCREMENT column in MySQL or AUTOINCREMENT column in SQLite.
-- There are three main types of floating-point numbers:
--      float(n)  is a floating-point number whose precision, is at least, n, up to a maximum of 8 bytes.
--      realor float8is a 4-byte floating-point number.
--      numeric or numeric(p,s) is a real number with p digits with s number after the decimal point. This numeric(p,s) is the exact number.
-- The temporal data types allow you to store date and /or time data. PostgreSQL has five main temporal data types:
--      DATE stores the dates only.
--      TIME stores the time of day values.
--      TIMESTAMP stores both date and time values.
--      TIMESTAMPTZ is a timezone-aware timestamp data type. It is the abbreviation for timestamp with the time zone.
--      INTERVAL stores periods.
--      The TIMESTAMPTZ is PostgreSQL’s extension to the SQL standard’s temporal data types.
-- In PostgreSQL, you can store an array of strings, an array of integers, etc., in array columns.
-- PostgreSQL provides two JSON data types: JSON and JSONB for storing JSON data.
--      The JSON data type stores plain JSON data that requires reparsing for each processing, 
--      while JSONB data type stores JSON data in a binary format which is faster to process but slower to insert. In addition, JSONB supports indexing, which can be an advantage.
-- The UUID data type allows you to store Universal Unique Identifiers defined by RFC 4122 .
-- Besides the primitive data types, PostgreSQL also provides several special data types related to geometry and network.
--      box – a rectangular box.
--      line – a set of points.
--      point – a geometric pair of numbers.
--      lseg – a line segment.
--      polygon – a closed geometric.
--      inet – an IP4 address.
--      macaddr– a MAC address.
--
-- Constraints
--      PostgreSQL includes the following column constraints:
--          NOT NULL – ensures that the values in a column cannot be NULL.
--          UNIQUE – ensures the values in a column are unique across the rows within the same table.
--          PRIMARY KEY – a primary key column uniquely identifies rows in a table. A table can have one and only one primary key. The primary key constraint allows you to define the primary key of a table.
--          CHECK – ensures the data must satisfy a boolean expression. For example, the value in the price column must be zero or positive.
--          FOREIGN KEY – ensures that the values in a column or a group of columns from a table exist in a column or group of columns in another table. Unlike the primary key, a table can have many foreign keys.
CREATE TABLE accounts (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR (50) UNIQUE NOT NULL,
    password VARCHAR (50) NOT NULL,
    email VARCHAR (255) UNIQUE NOT NULL,
    created_at TIMESTAMP NOT NULL,
    last_login TIMESTAMP
);

-- Basic PostgreSQL SELECT INTO statement example
-- The following statement uses the SELECT INTO statement to create a new table called film_r that contains films with the rating R and rental duration 5 days from the film table.
SELECT
    film_id,
    title,
    rental_rate INTO TABLE film_r
FROM
    film
WHERE
    rating = 'R'
    AND rental_duration = 5
ORDER BY
    title;

-- Create table keyword
CREATE TABLE action_film AS
SELECT
    film_id,
    title,
    release_year,
    length,
    rating
FROM
    film
    INNER JOIN film_category USING (film_id)
WHERE
    category_id = 1;

-- another exaple
CREATE TABLE IF NOT EXISTS film_rating (rating, film_count) AS
SELECT
    rating,
    COUNT (film_id)
FROM
    film
GROUP BY
    rating;

-- for make unique serial 
id SERIAL PRIMARY KEY,
-- PostgreSQL CREATE SEQUENCE statement
-- CREATE SEQUENCE [ IF NOT EXISTS ] sequence_name
--     [ AS { SMALLINT | INT | BIGINT } ]
--     [ INCREMENT [ BY ] increment ]
--     [ MINVALUE minvalue | NO MINVALUE ] 
--     [ MAXVALUE maxvalue | NO MAXVALUE ]
--     [ START [ WITH ] start ] 
--     [ CACHE cache ] 
--     [ [ NO ] CYCLE ]
--     [ OWNED BY { table_name.column_name | NONE } ]
CREATE TABLE order_details(
    order_id SERIAL,
    item_id INT NOT NULL,
    item_text VARCHAR NOT NULL,
    price DEC(10, 2) NOT NULL,
    PRIMARY KEY(order_id, item_id)
);

CREATE SEQUENCE order_item_id START 10 INCREMENT 10 MINVALUE 10 OWNED BY order_details.item_id;

INSERT INTO
    order_details(order_id, item_id, item_text, price)
VALUES
    (100, nextval('order_item_id'), 'DVD Player', 100),
    (100, nextval('order_item_id'), 'Android TV', 550),
    (100, nextval('order_item_id'), 'Speaker', 250);

-- Listing all sequences in a database
SELECT
    relname sequence_name
FROM
    pg_class
WHERE
    relkind = 'S';

-- Deleting sequences
-- If a sequence is associated with a table column,
-- it will be automatically dropped once the table column is removed
-- or the table is dropped.You can also remove a sequence manually using the DROP SEQUENCE statement:
DROP TABLE order_details;