-- The following show the basic syntax of the CREATE INDEX statement:
-- CREATE INDEX index_name ON table_name [USING method] (
--     column_name [ASC | DESC] [NULLS {FIRST | LAST }],
--     ...
-- );
--
-- In this syntax:
--  First, specify the index name after the CREATE INDEX clause. The index name should be meaningful and easy to remember.
--  Second, specify the name of the table to which the index belongs.
--  Third, specify the index method such as btree, hash, gist, spgist, gin, and brin. PostgreSQL uses btree by default.
--  Finally, list one or more columns of the index. The ASC and DESC specify the sort order. The default sort order is ASC.
--  If a column contains NULL, you can specify NULLS FIRST or NULLS LAST option. The NULLS FIRST is the default when DESC is specified and NULLS LAST is the default when DESC is not specified.
--
-- To check if a query uses an index or not, you use the EXPLAIN statement.
EXPLAIN
SELECT
    *
FROM
    address
WHERE
    phone = '223664661973';

-- create an index
CREATE INDEX idx_address_phone ON address(phone);

-- PostgreSQL DROP INDEX
DROP INDEX idx_actor_first_name;

-- The following statement lists all indexes of the schema public in the current database:
SELECT
    tablename,
    indexname,
    indexdef
FROM
    pg_indexes
WHERE
    schemaname = 'public'
ORDER BY
    tablename,
    indexname;

-- PostgreSQL Index Types
-- B-tree indexes
-- PostgreSQL query planner will consider using a B-tree index whenever index columns are involved in a comparison that uses one of the following operators:
--      <
--      <=
--      =
--      >=
--      BETWEEN
--      IN
--      IS NULL
--      IS NOT NULL
-- Hash indexes
-- Hash indexes can handle only simple equality comparison (=). 
CREATE INDEX index_name ON table_name USING HASH (indexed_column);

-- GIN indexes
-- GIN indexes are most useful when you have multiple values stored in a single column, for example, hstore, array, jsonb, and range types.
--
-- BRIN
-- BRIN allows the use of an index on a very large table that would previously be impractical using a B-tree without horizontal partitioning.
--
-- GiST Indexes
-- GiST indexes allow the building of general tree structures. GiST indexes are useful in indexing geometric data types and full-text searches.
--
-- SP-GiST Indexes
-- SP-GiST indexes are most useful for data that has a natural clustering element to it and is also not an equally balanced tree, for example, GIS, multimedia, phone routing, and IP routing.
--
-- Partial Index (just index a part based on where clause)
-- To define an index that includes only inactive customers, you use the following statement:
CREATE INDEX idx_customer_inactive ON customer(active)
WHERE
    active = 0;

-- To recreate a single index, you specify the index name after REINDEX INDEX clause as follows:
REINDEX INDEX index_name;

-- To recreate all the indexes of a table, you use the TABLE keyword and specify the name of the table:
REINDEX TABLE table_name;

-- To recreate all indices in a specific database, you specify the database name after the REINDEX DATABASE clause:
REINDEX DATABASE database_name;

-- The following statement recreates all indices on system catalogs in a specific database:
REINDEX SYSTEM database_name;

--
-- REINDEX Lock write not read. Drop index lock read write. Create index lock write not read. Reindex is better than drop create index.
--
-- PostgreSQL Multicolumn
-- A multicolumn index can have a maximum of 32 columns of a table. The limit can be changed by modifying the pg_config_manual.h when building PostgreSQL.
CREATE INDEX idx_people_names ON people (last_name, first_name);