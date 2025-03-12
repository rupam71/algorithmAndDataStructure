-- view all the databases in the current PostgreSQL database server using the \l command:
-- To get all roles in the current PostgreSQL database server, you can query them from the pg_roles system catalog as follows:
SELECT
    rolname
FROM
    pg_roles;

-- create new role 
CREATE ROLE bob;

-- Noice that the roles that start with with pg_ are system roles.
-- If you use the psql tool, you can use the \du command to list all existing roles in the current PostgreSQL database server.
--
-- Role attributes 
-- creates a role called alice that has the login privilege and an initial password:
CREATE ROLE alice LOGIN PASSWORD 'securePass1';

-- you can use the role alice to log in to the PostgreSQL database server using the psql client tool:
psql - U alice - W postgres;

-- creates a role called john that has the superuser attribute.
-- The superuser can override all access restrictions within the database therefore you should create this role only when needed.
CREATE ROLE john SUPERUSER LOGIN PASSWORD 'securePass1';

-- create roles that have the database creation privilege, you use the CREATEDB attribute:
CREATE ROLE dba CREATEDB LOGIN PASSWORD 'Abcd1234';

-- the following statement creates a dev_api role with password valid until the end of 2029:
-- After one second tick in 2030, the password of dev_api is no longer valid.
CREATE ROLE dev_api WITH LOGIN PASSWORD 'securePass1' VALID UNTIL '2030-01-01';

-- reates a new role called api that can make 1000 concurent connections:
CREATE ROLE api LOGIN PASSWORD 'securePass1' CONNECTION
LIMIT
    1000;

-- GRANT
-- GRANT SELECT| INSERT| UPDATE| DELETE| TRUNCATE | ALL 
-- ON  table_name
-- TO  role_name;
-- To grant the SELECT privilege on the candidates table to the role joe, you execute the following GRANT statement in the postgres‘ session:
GRANT
SELECT
    ON candidates TO joe;

-- Grant SELECT on all tables
GRANT
SELECT
    ON ALL TABLES IN SCHEMA "public" TO reader;

-- The REVOKE statement revokes previously granted privileges on database objects from a role.
-- REVOKE privilege | ALL 
-- ON TABLE table_name | ALL TABLES 
-- IN SCHEMA schema_name
-- FROM
--     role_name;
--
-- CREATE GROUP ROLE
-- alice now member of sales group
--
-- GRANT sales TO alice;
-- To change attributes of a role, you use the following form of ALTER ROLE statement:
ALTER ROLE role_name [WITH] option;

-- The option can be:
--      SUPERUSER | NOSUPERUSER – determine if the role is a superuser or not.
--      CREATEDB | NOCREATEDB– allow the role to create new databases.
--      CREATEROLE | NOCREATEROLE – allow the role to create or change roles.
--      INHERIT | NOINHERIT – determine if the role to inherit privileges of roles of which it is a member.
--      LOGIN | NOLOGIN – allow the role to log in.
--      REPLICATION | NOREPLICATION – determine if the role is a replication roles.
--      BYPASSRLS | NOBYPASSRLS – determine if the role to by pass a row-level security (RLS) policy.
--      CONNECTION LIMIT limit – specify the number of concurrent connection a role can made, -1 means unlimited.
--      PASSWORD 'password' | PASSWORD NULL – change the role’s password.
--      VALID UNTIL 'timestamp' – set the date and time after which the role’s password is no long valid.
--
-- To change the name of a role, you use the following form of the ALTER ROLE statement:
ALTER ROLE role_name TO new_name;

-- To remove a specified role, you use the DROP ROLE statement:
DROP ROLE [IF EXISTS] target_role;

--  use the \du to list all user accounts (or roles) in the current PostgreSQL database server:
-- If you want to show more information, you can use the \du+ command:
postgres = #\du+;
-- following statement returns all users in the current database server by querying data from the pg_catalog.pg_user catalog:
SELECT
    usename AS role_name,
    CASE
        WHEN usesuper
        AND usecreatedb THEN CAST('superuser, create database' AS pg_catalog.text)
        WHEN usesuper THEN CAST('superuser' AS pg_catalog.text)
        WHEN usecreatedb THEN CAST('create database' AS pg_catalog.text)
        ELSE CAST('' AS pg_catalog.text)
    END role_attributes
FROM
    pg_catalog.pg_user
ORDER BY
    role_name desc;
    