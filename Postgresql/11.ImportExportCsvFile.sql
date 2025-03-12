-- To import this CSV file into the persons table, you use COPY statement as follows:
COPY persons(first_name, last_name, dob, email)
FROM
    'C:\sampledb\persons.csv' DELIMITER ',' CSV HEADER;

-- Let’s dive into the COPY statement in more detail.
--  First, you specify the table with column names after the COPY keyword. The order of the columns must be the same as the ones in the CSV file. In case the CSV file contains all columns of the table, you don’t need to specify them explicitly, for example:
--  Second, you put the CSV file path after the FROM keyword. Because CSV file format is used, you need to specify DELIMITER as well as CSV clauses.
--  Third, specify the HEADER keyword to indicate that the CSV file contains a header. When the COPY command imports data, it ignores the header of the file.
--  Notice that the file must be read directly by the PostgreSQL server, not by the client application. Therefore, it must be accessible by the PostgreSQL server machine. Also, you need to have superuser access in order to execute the COPY statement successfully.
-- Export data from a table to CSV using COPY statement
COPY persons TO 'C:\tmp\persons_db.csv' DELIMITER ',' CSV HEADER;

-- In some cases, you want to export data from just some columns of a table to a CSV file. 
COPY persons(first_name, last_name, email) TO 'C:\tmp\persons_partial_db.csv' DELIMITER ',' CSV HEADER;

-- If you don’t want to export the header, which contains the column names of the table, just remove the HEADER flag in the COPY statement.
COPY persons(email) TO 'C:\tmp\persons_email_db.csv' DELIMITER ',' CSV;

-- For example, if you want to export all data of the persons table into persons_client.csv file, you can execute the \copy command from the psql client as follows:
\ copy (
    SELECT
        *
    FROM
        persons
) to 'C:\tmp\persons_client.csv' with csv