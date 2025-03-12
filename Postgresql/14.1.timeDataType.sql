-- DATE DATA TYPE
-- PostgreSQL DATE data type. PostgreSQL uses 4 bytes to store a date value. The lowest and highest values of the DATE data type are 4713 BC and 5874897 AD.
CREATE TABLE documents (
    document_id serial PRIMARY KEY,
    header_text VARCHAR (255) NOT NULL,
    posting_date DATE NOT NULL DEFAULT CURRENT_DATE
);

-- get current date time
SELECT
    NOW();

-- get current date only 
SELECT
    NOW() :: date;

-- formatting 
-- 23/06/2016
SELECT
    TO_CHAR(NOW() :: DATE, 'dd/mm/yyyy');

--  Jun 23, 2016
SELECT
    TO_CHAR(NOW() :: DATE, 'Mon dd, yyyy');

-- Get the interval between two dates
now() - hire_date;

-- Calculate ages in years, months, and days
-- If you pass a date value to the AGE() function, it will subtract that date value from the current date. If you pass two arguments to the AGE() function, it will subtract the second argument from the first argument.
AGE(birth_date);

age('2015-01-01', birth_date);

-- To get the year, quarter, month, week, day from a date value, you use the EXTRACT() function.
SELECT
    employee_id,
    first_name,
    last_name,
    EXTRACT (
        YEAR
        FROM
            birth_date
    ) AS YEAR,
    EXTRACT (
        MONTH
        FROM
            birth_date
    ) AS MONTH,
    EXTRACT (
        DAY
        FROM
            birth_date
    ) AS DAY
FROM
    employees;

-- TIMESTAMP DATA TYPE
-- both timestamp and timestamptz uses 8 bytes for storing the timestamp values
-- PostgreSQL provides you with two temporal data types for handling timestamp:
--      timestamp: a timestamp without timezone one.
--      timestamptz: timestamp with a timezone.
-- PostgreSQL stores the timestamptz in UTC value. 
--      When you insert a value into a timestamptz column, PostgreSQL converts the timestamptz value into a UTC value and stores the UTC value in the table.
--      When you query timestamptz from the database, PostgreSQL converts the UTC value back to the time value of the timezone set by the database server, the user, or the current database connection.
CREATE TABLE timestamp_demo (ts TIMESTAMP, tstz TIMESTAMPTZ);

-- Getting the current time
SELECT
    NOW();

SELECT
    CURRENT_TIMESTAMP;

-- To get the time of day in the string format, you use the timeofday() function.
-- Wed Jun 22 20:51:12.632420 2016 PDT
SELECT
    TIMEOFDAY();

-- To convert a timestamp to another time zone, you use the timezone(zone, timestamp) function.
SELECT
    timezone('America/New_York', '2016-06-01 00:00');

-- PostgreSQL TIME data type
-- The TIME data type requires 8 bytes and its allowed range is from 00:00:00 to 24:00:00.
CREATE TABLE shifts (
    id serial PRIMARY KEY,
    shift_name VARCHAR NOT NULL,
    start_at TIME NOT NULL,
    end_at TIME NOT NULL
);

-- TIME with time zone type
SELECT
    LOCALTIME AT TIME ZONE 'UTC-7';

-- The field can be the hour, minute, second, milliseconds as shown in the following example:
SELECT
    LOCALTIME,
    EXTRACT (
        HOUR
        FROM
            LOCALTIME
    ) as hour,
    EXTRACT (
        MINUTE
        FROM
            LOCALTIME
    ) as minute,
    EXTRACT (
        SECOND
        FROM
            LOCALTIME
    ) as second,
    EXTRACT (
        milliseconds
        FROM
            LOCALTIME
    ) as milliseconds;

-- Arithmetic operations on time values
SELECT
    time '10:00' - time '02:00' AS result;