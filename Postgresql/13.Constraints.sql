-- PostgreSQL primary key A primary key is a column
-- or a group of columns used to uniquely identify a row in a table.The column that participates in the primary key is known as the primary key column.A table can have zero
-- or one primary key.It cannot have more than one primary key.
--
-- 1) Creating a table with a primary key that consists of one column
order_id SERIAL PRIMARY KEY,
-- 2) Creating a table with a primary key that consists of two columns
CREATE TABLE order_items(
    order_id INT,
    item_no SERIAL,
    item_description VARCHAR NOT NULL,
    quantity INTEGER NOT NULL,
    price DEC(10, 2),
    PRIMARY KEY (order_id, item_no)
);

--  add a primary key constraint to the products table using the ALTER TABLE ... ADD PRIMARY KEY statement:
ALTER TABLE
    products
ADD
    PRIMARY KEY (product_id);

-- 4) Adding an auto-incremented primary key to an existing table
ALTER TABLE
    vendors
ADD
    COLUMN vendor_id SERIAL PRIMARY KEY;

-- Drop a primary key
ALTER TABLE
    table_name DROP CONSTRAINT primary_key_constraint;

-- In PostgreSQL, a foreign key is a column or a group of columns in a table that uniquely identifies a row in another table.
-- A foreign key establishes a link between the data in two tables by referencing the primary key or a unique constraint of the referenced table.
-- The table containing a foreign key is referred to as the referencing table or child table. Conversely, the table referenced by a foreign key is known as the referenced table or parent table.
CREATE TABLE customers(
    customer_id INT GENERATED ALWAYS AS IDENTITY,
    customer_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(customer_id)
);

CREATE TABLE contacts(
    contact_id INT GENERATED ALWAYS AS IDENTITY,
    customer_id INT,
    contact_name VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    PRIMARY KEY(contact_id),
    CONSTRAINT fk_customer FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

-- The SET NULL automatically sets NULL to the foreign key columns in the referencing rows of the child table when the referenced rows in the parent table are deleted.
CONSTRAINT fk_customer FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE
SET
    NULL;

-- The ON DELETE CASCADE automatically deletes all the referencing rows in the child table when the referenced rows in the parent table are deleted. In practice, the ON DELETE CASCADE is the most commonly used option.
ON DELETE CASCADE;

-- The ON DELETE SET DEFAULT sets the default value to the foreign key column of the referencing rows in the child table when the referenced rows from the parent table are deleted.
--
-- PostgreSQL CHECK constraint
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    birth_date DATE NOT NULL,
    joined_date DATE NOT NULL,
    salary numeric CHECK(salary > 0)
);

-- Adding PostgreSQL CHECK constraints for existing tables
ALTER TABLE
    employees
ADD
    CONSTRAINT joined_date_check CHECK (joined_date > birth_date);

-- Removing a CHECK constraint example
ALTER TABLE
    employees DROP CONSTRAINT joined_date_check;

-- PostgreSQL UNIQUE constraint
CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    email VARCHAR (50) UNIQUE
);

-- PostgreSQL Not-Null Constraint
-- Note that a column can have multiple constraints such as NOT NULL, check, unique, foreign key appearing next to each other.
CREATE TABLE invoices(
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    qty numeric NOT NULL CHECK(qty > 0),
    net_price numeric CHECK(net_price > 0)
);