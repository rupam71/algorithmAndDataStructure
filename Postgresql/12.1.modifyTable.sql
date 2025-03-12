-- To change the structure of an existing table, you use PostgreSQL ALTER TABLE statement.
ALTER TABLE
    table_name action;

-- PostgreSQL provides you with many actions:
--
--  Add a column
ALTER TABLE
    links
ADD
    COLUMN active boolean;

--  Drop a column
ALTER TABLE
    links DROP COLUMN active;

--  Change the data type of a column
ALTER TABLE
    links
ADD
    COLUMN target VARCHAR(10);

ALTER TABLE
    customers
ALTER COLUMN
    contact_name
SET
    NOT NULL;

--  Rename a column
ALTER TABLE
    links RENAME COLUMN title TO link_title;

--  Set a default value for the column.
ALTER TABLE
    links
ALTER COLUMN
    target
SET
    DEFAULT '_blank';

--  Add a constraint to a column.
ALTER TABLE
    links
ADD
    CONSTRAINT unique_url UNIQUE (url);

--  Rename a table
ALTER TABLE
    links RENAME TO urls;

--  The following statement adds a CHECKcondition to the targetcolumn so that the targetcolumn only accepts the following values: _self, _blank, _parent, and _top:
ALTER TABLE
    links
ADD
    CHECK (target IN ('_self', '_blank', '_parent', '_top'));

-- To remove all data from a table, you use the DELETE statement without a WHERE clause. However, when the table has numerous data, the DELETE statement is not efficient. In this case, you can use the TRUNCATE TABLE statement.
TRUNCATE TABLE table_name1,
table_name2,
...;

TRUNCATE TABLE products;

-- By default, the TRUNCATE TABLE statement does not remove any data from the table that has foreign key references.
-- To remove data from a table and other tables that have foreign key references the table, you use CASCADE option in the TRUNCATE TABLE statement as follows :
TRUNCATE TABLE table_name CASCADE;

TRUNCATE TABLE orders CASCADE;

-- To fire the trigger when the TRUNCATE TABLE statement executes, you need to define  BEFORE TRUNCATE and/or  AFTER TRUNCATE triggers for that table.
--
-- When to use temporary tables
--      Isolation of data: Since the temporary tables are session-specific, different sessions or transactions can use the same table name for temporary tables without causing a conflict. This allows you to isolate data for a specific task or session.
--      Intermediate storage: Temporary tables can be useful for storing the intermediate results of a complex query. For example, you can break down a complex query into multiple simple ones and use temporary tables as the intermediate storage for storing the partial results.
--      Transaction scope: Temporary tables can be also useful if you want to store intermediate results within a transaction. In this case, the temporary tables will be visible only to that transaction
--
--
--
-- Introduction to PostgreSQL copy table statement
-- To copy a table completely, including both table structure and data, you use the following statement:
CREATE TABLE new_table AS TABLE existing_table;

-- To copy a table structure without data, you add the WITH NO DATA clause to the CREATE TABLE statement as follows:
CREATE TABLE new_table AS TABLE existing_table WITH NO DATA;

-- To copy a table with partial data from an existing table, you use the following statement:
CREATE TABLE new_table AS
SELECT
    *
FROM
    existing_table
WHERE
    condition;