-- Following the raise statement is the level option that specifies the error severity.
raise level format;
-- PostgreSQL provides the following levels:
--      debug
--      log
--      notice
--      info
--      warning
--      exception (default)
-- The format is a string that specifies the message. The format uses percentage ( %) placeholders that will be substituted by the arguments.
do $$ 
begin 
  raise info 'information message %', now() ;
  raise log 'log message %', now();
  raise debug 'debug message %', now();
  raise warning 'warning message %', now();
  raise notice 'notice message %', now();
end $$;

-- To raise an error, you use the exception level after the raise statement. Note that raise statement uses the exception level by default.
-- Besides raising an error, you can add more information by using the following additional clause:
using option = expression
-- The option can be:
--      message: set error message
--      hint: provide the hint message so that the root cause of the error is easier to be discovered.
--      detail:  give detailed information about the error.
--      errcode: identify the error code, which can be either by condition name or directly five-character SQLSTATE code. Please refer to the table of error codes and condition names.
do $$ 
declare
  email varchar(255) := 'info@postgresqltutorial.com';
begin 
  -- check email for duplicate
  -- ...
  -- report duplicate email
  raise exception 'duplicate email: %', email 
		using hint = 'check the email again';
end $$;

-- assert statement
-- The assert statement is a useful shorthand for inserting debugging checks into PL/pgSQL code.
assert condition [, message];
-- if condition false than exception occure
-- message is optional
do $$
declare 
   film_count integer;
begin
   select count(*)
   into film_count
   from film;
   
   assert film_count > 0, 'Film not found, check the film table';
end$$;
