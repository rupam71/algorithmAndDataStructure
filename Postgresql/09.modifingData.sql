-- The PostgreSQL INSERT statement allows you to insert a new row into a table.
-- The INSERT statement has an optional RETURNING clause that returns the information of the inserted row.
INSERT INTO
    table1(column1, column2, …)
VALUES
    (value1, value2, …) RETURNING *;

INSERT INTO
    contacts (first_name, last_name, email)
VALUES
    ('John', 'Doe', 'john.doe@example.com'),
    ('Jane', 'Smith', 'jane.smith@example.com'),
    ('Bob', 'Johnson', 'bob.johnson@example.com');

-- For example, the following statement returns the id of the inserted row:
RETURNING id;

-- To rename the returned value, you use the AS keyword followed by the name of the output. For example:
RETURNING output_expression AS output_name;

-- To insert a date into a DATE column, you use the date in the format 'YYYY-MM-DD'.
-- First, specify the name of the table that you want to update data after the UPDATE keyword.
-- Second, specify columns and their new values after SET keyword. The columns that do not appear in the SET clause retain their original values.
-- Third, determine which rows to update in the condition of the WHERE clause.
-- The WHERE clause is optional. If you omit the WHERE clause, the UPDATE statement will update all rows in the table.
UPDATE
    courses
SET
    published_date = '2020-07-01'
WHERE
    course_id = 2 RETURNING *;

-- Sometimes, you need to update data in a table based on values in another table. In this case, you can use the PostgreSQL UPDATE join.
UPDATE
    product
SET
    net_price = price - price * discount
FROM
    product_segment
WHERE
    product.segment_id = product_segment.id;

-- First, specify the name (table_name) of the table from which you want to delete data after the DELETE FROM keywords.
-- Second, specify a condition in the WHERE clause to determine which rows to delete.
-- The WHERE clause is optional. If you omit the WHERE clause, the DELETE statement will delete all rows in the table.
-- If you delete data from a table based on data from another table, you can use the DELETE JOIN statement.
DELETE FROM
    todos
WHERE
    id = 2 RETURNING *;

-- First, specify the name of the table (table1) from which you want to delete data after the DELETE FROM keywords
-- Second, provide a table (table2) to join with the main table after the USING keyword.
-- Third, define a condition in the WHERE clause for joining two tables.
-- Finally, return the deleted rows in the RETURNING clause. The RETURNING clause is optional.
DELETE FROM
    member USING denylist
WHERE
    member.phone = denylist.phone;

-- Delete join using a subquery example
DELETE FROM
    member
WHERE
    phone IN (
        SELECT
            phone
        FROM
            denylist
    );

-- the PostgreSQL upsert feature to insert a new row into a table if the row does not exist, or update the row if it already exists.
-- Upsert is a combination of update and insert. The upsert allows you to update an existing row or insert a new one if it doesn’t exist.
-- PostgreSQL does not have the UPSERT statement but it supports the upsert operation via the INSERT...ON CONFLICT statement.
INSERT INTO
    table_name (column1, column2,...)
VALUES
    (value1, value2,...) ON CONFLICT (conflict_column) DO NOTHING | DO
UPDATE
SET
    column1 = value1,
    column2 = value2,
...;

-- In this syntax:
-- table_name: This is the name of the table where you want to insert data.
-- (column1, column2, ...): The list of columns for which you provide values to insert into the table.
-- VALUES(value1, value2, ...): The values you want to insert into the specified columns (column1, column2, ...).
-- ON CONFLICT (conflict_column): This clause specifies the conflict target, which is the unique constraint or unique index that may cause a conflict.
-- DO NOTHING: This instructs PostgreSQL to do nothing when a conflict occurs.
-- DO UPDATE: This performs an update if a conflict occurs.
-- SET column = value1, column = value2, ...: This list of the columns to be updated and their corresponding values in case of conflict.
-- How the INSERT ... ON CONFLICT statement works.
-- First, the ON CONFLICT clause identifies the conflict target which is usually a unique constraint (or a unique index). If the data that you insert violates the constraint, a conflict occurs.
-- Second, the DO UPDATE instructs PostgreSQL to update existing rows or do nothing rather than aborting the entire operation when a conflict occurs.
-- Third, the SET clause defines the columns and values to update. You can use new values or reference the values you attempted to insert using the EXCLUDED keyword.
INSERT INTO
    inventory (id, name, price, quantity)
VALUES
    (4, 'D', 29.99, 20) ON CONFLICT(id) DO
UPDATE
SET
    price = EXCLUDED.price,
    quantity = EXCLUDED.quantity;