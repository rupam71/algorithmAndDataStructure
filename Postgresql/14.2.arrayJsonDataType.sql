-- PostgreSQL Array
CREATE TABLE contacts (
    id serial PRIMARY KEY,
    name VARCHAR (100),
    phones TEXT []
);

-- Insert PostgreSQL array values
INSERT INTO
    contacts (name, phones)
VALUES
    (
        'John Doe',
        ARRAY [ '(408)-589-5846','(408)-589-5555' ]
    );

-- or with curly bracket
INSERT INTO
    contacts (name, phones)
VALUES
    ('Lily Bush', '{"(408)-589-5841"}'),
    (
        'William Gate',
        '{"(408)-589-5842","(408)-589-58423"}'
    );

-- query array by number. here 1 is 0th index or first element
SELECT
    name,
    phones [ 1 ]
FROM
    contacts
WHERE
    phones [ 2 ] = '(408)-589-58423';

-- Modifying PostgreSQL array
UPDATE
    contacts
SET
    phones [2] = '(408)-589-5843'
WHERE
    ID = 3;

-- Search in PostgreSQL Array
SELECT
    name,
    phones
FROM
    contacts
WHERE
    '(408)-589-5555' = ANY (phones);

-- PostgreSQL provides the unnest() function to expand an array to a list of rows. For example,  the following query expands all phone numbers of the phones array.
SELECT
    name,
    unnest(phones)
FROM
    contacts;

-- PostgreSQL JSON
CREATE TABLE orders (
    id serial NOT NULL PRIMARY KEY,
    info json NOT NULL
);

-- Insert JSON data
INSERT INTO
    orders (info)
VALUES
    (
        '{ "customer": "John Doe", "items": {"product": "Beer","qty": 6}}'
    );

-- Querying JSON data
-- PostgreSQL provides two native operators -> and ->> to help you query JSON data.
--      The operator -> returns JSON object field by key.
--      The operator ->> returns JSON object field by text.
SELECT
    info -> 'customer' AS customer
FROM
    orders;

SELECT
    info ->> 'customer' AS customer
FROM
    orders;

-- to access info.item.product
-- here first info -> items return json items object
-- items ->> product return items.object as string
SELECT
    info ->> 'customer' AS customer,
    info -> 'items' ->> 'product' as product
FROM
    orders
ORDER BY
    product;

-- Use JSON operator in WHERE clause
SELECT
    info ->> 'customer' AS customer
FROM
    orders
WHERE
    info -> 'items' ->> 'product' = 'Diaper';

-- Apply aggregate functions to JSON data
SELECT
    MIN (CAST (info -> 'items' ->> 'qty' AS INTEGER)),
    MAX (CAST (info -> 'items' ->> 'qty' AS INTEGER)),
    SUM (CAST (info -> 'items' ->> 'qty' AS INTEGER)),
    AVG (CAST (info -> 'items' ->> 'qty' AS INTEGER))
FROM
    orders;