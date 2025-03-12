-- Grouping set
-- this actully give use unino all of 4 group by result.
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    GROUPING SETS (
        (brand, segment),
        (brand),
        (segment),
        ()
    );

-- the ROLLUP(c1,c2,c3) generates only four grouping sets, assuming the hierarchy c1 > c2 > c3 as follows:
-- Different from the CUBE subclause, ROLLUP does not generate all possible grouping sets based on the specified columns. It just makes a subset of those.
-- very important for report 
-- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-rollup/
SELECT
    c1,
    c2,
    c3,
    aggregate(c4)
FROM
    table_name
GROUP BY
    ROLLUP (c1, c2, c3);

-- For example, the CUBE (c1,c2,c3) makes all eight possible grouping sets:
--  (c1, c2, c3)
--  (c1, c2)
--  (c2, c3)
--  (c1,c3)
--  (c1)
--  (c2)
--  (c3)
--  ()
-- However, the ROLLUP (c1,c2,c3) generates only four grouping sets, assuming the hierarchy c1 > c2 > c3 as follows:
--  (c1, c2, c3)
--  (c1, c2)
--  (c1)
--  ()

-- The query generates all possible grouping sets based on the dimension columns specified in CUBE. The CUBE subclause is a short way to define multiple grouping sets 
-- In general, if the number of columns specified in the CUBE is n, then you will have 2n combinations.
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    CUBE (brand, segment)
ORDER BY
    brand,
    segment;








