-- PostgreSQL uses one byte for storing a boolean value in the database. The BOOLEAN can be abbreviated as BOOL.
-- In standard SQL, a Boolean value can be TRUE, FALSE, or NULL.
CREATE TABLE stock_availability (
    product_id INT PRIMARY KEY,
    available BOOLEAN NOT NULL,
    is_ok BOOL DEFAULT 't'
);

-- PostgreSQL character type
CREATE TABLE character_tests (
    id serial PRIMARY KEY,
    x CHAR (1),
    y VARCHAR (10),
    z TEXT
);

-- PostgreSQL NUMERIC Type
NUMERIC(precision, scale) -- In this syntax, the precision is the total number of digits and the scale is the number of digits in the fraction part. For example, the number 1234.567 has the precision 7 and scale 3.
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(5, 2)
);

-- PostgreSQL Integer Data Types
-- The SMALLINT requires 2 bytes storage size which can store any integer numbers that is in the range of (-32,767, 32,767).
-- The INTEGER type requires 4 bytes storage size that can store numbers in the range of (-2,147,483,648, 2,147,483,647).
-- The BIGINT type requires 8 bytes storage size that can store any number in the range of (-9,223,372,036,854,775,808,+9,223,372,036,854,775,807).
-- Using BIGINT type is not only consuming a lot of storage but also decreasing the performance of the database, therefore, you should have a good reason to use it.
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR (255) NOT NULL,
    pages SMALLINT NOT NULL CHECK (pages > 0),
    population INT NOT NULL CHECK (population >= 0)
);

-- PostgreSQL UUID Data Type
-- "uuid-ossp" module provides some handy functions that implement standard algorithms for generating UUIDs.
-- To install the uuid-ossp module, you use the CREATE EXTENSION statement as follows:
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- generate the UUID values based on the combination of computer’s MAC address, current timestamp, and a random value, you use the uuid_generate_v1() function
SELECT
    uuid_generate_v1();

-- If you want to generate a UUID value solely based on random numbers, you can use the uuid_generate_v4() function
SELECT
    uuid_generate_v4();

-- generate automatic uuid as primary
CREATE TABLE contacts (
    contact_id uuid DEFAULT uuid_generate_v4 (),
    PRIMARY KEY (contact_id)
);

-- PostgreSQL hstore
-- The hstore module implements the hstore data type for storing key-value pairs in a single value.
-- The hstore data type is very useful in many cases, such as semi-structured data or rows with many attributes that are rarely queried.
--
-- PostgreSQL User-defined Data Types
-- PostgreSQL allows you to create user-defined data types through the following statements:
--      CREATE DOMAIN creates a user-defined data type with constraints such as NOT NULL, CHECK, etc.
--      CREATE TYPE creates a composite type used in stored procedures as the data types of returned values.
CREATE DOMAIN contact_name AS VARCHAR NOT NULL CHECK (value !~ '\s');

CREATE TABLE mailing_list (
    id serial PRIMARY KEY,
    first_name contact_name,
    last_name contact_name,
    email VARCHAR NOT NULL
);

-- Getting domain information
SELECT
    typname
FROM
    pg_catalog.pg_type
    JOIN pg_catalog.pg_namespace ON pg_namespace.oid = pg_type.typnamespace
WHERE
    typtype = 'd'
    and nspname = '<schema_name>';

-- To change or remove a domain, you use the ALTER DOMAIN or DROP DOMAIN respectively.
-- To view all domains in the current database, you use the \dD command as follows:
--
-- PostgreSQL CREATE TYPE
-- The CREATE TYPE statement allows you to create a composite type, which can be used as the return type of a function.
CREATE TYPE film_summary AS (
    film_id INT,
    title VARCHAR,
    release_year SMALLINT
);

--  use the film_summary data type as the return type of a function:
CREATE
OR REPLACE FUNCTION get_film_summary (f_id INT) RETURNS film_summary AS $ $
SELECT
    film_id,
    title,
    release_year
FROM
    film
WHERE
    film_id = f_id;

$ $ LANGUAGE SQL;

--Third, call the get_film_summary() function:
SELECT
    *
FROM
    get_film_summary (40);

-- To change a user-defined type, you use the ALTER TYPE statement. To remove a user-defined type, you use the DROP TYPE statement.
-- If you use the psql program, you can list all user-defined types in the current database using the \dT or \dT+ command