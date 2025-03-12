-- PostgreSQL transactions using the BEGIN, COMMIT, and ROLLBACK statements.
--
-- A PostgreSQL transaction is atomic, consistent, isolated, and durable.
--  These properties are often referred to as ACID:
--      Atomicity guarantees that the transaction is completed in an all-or-nothing manner.
--      Consistency ensures the change to data written to the database must be valid and follow predefined rules.
--      Isolation determines how transaction integrity is visible to other transactions.
--      Durability makes sure that transactions that have been committed will be stored in the database permanently.
-- begin the transaction
BEGIN;

-- deduct the amount from the account 1
UPDATE
    accounts
SET
    balance = balance - 1500
WHERE
    id = 1;

-- add the amount from the account 3 (instead of 2)
UPDATE
    accounts
SET
    balance = balance + 1500
WHERE
    id = 3;

-- commit the transaction
-- use this if everytings ok. Then block
COMMIT;

-- roll back the transaction
-- use this if crash happen. Catch block
ROLLBACK;