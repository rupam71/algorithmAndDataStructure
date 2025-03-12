-- PostgreSQL PL/pgSQL
-- PL/pgSQL is a procedural programming language for the PostgreSQL database system.
-- PL/pgSQL allows you to extend the functionality of the PostgreSQL database server by creating server objects with complex logic.
-- PL/pgSQL was designed to :
--      Create user-defined functions, stored procedures, and triggers.
--      Extend standard SQL by adding control structures such as if, case, and loop statements.
--      Inherit all user-defined functions, operators, and types.
--
-- PL/pgSQL wraps multiple statements in an object and store it on the PostgreSQL database server.
-- So instead of sending multiple statements to the server one by one, you can send one statement to execute the object stored in the server. This allows you to:
--      Reduce the number of round trips between the application and the PostgreSQL database server.
--      Avoid transferring the immediate results between the application and the server.
--
-- Besides the advantages of using PL/pgSQL, there are some caveats:
--      Slower in software development because PL/pgSQL requires specialized skills that many developers do not possess.
--      Difficult to manage versions and hard to debug.
--      May not be portable to other database management systems.
--
-- Dollar-Quoted String Constants
select
    'String constant';

select
    'I''m also a string constant';

-- If a string constant contains a backslash, you need to escape it by using another backslash.
-- The following shows the syntax of the dollar-quoted string constants:
$ tag $ < string_constant > $ tag $
select
    $ $ I 'm a string constant that contains a backslash \$$;
SELECT $message$I' m a string constant that contains a backslash \ $ message $;

-- here evertything in between $$ is a open tag and closed tag place in the end. 
-- better to use like $$ string $$
--
-- PL/pgSQL Block Structure
-- do $$ 
-- <<first_block>>
-- declare
--   film_count integer := 0;
-- begin
--    -- get the number of films
--    select count(*) 
--    into film_count
--    from film;
--    -- display a message
--    raise notice 'The number of films is %', film_count;
-- end first_block $$;