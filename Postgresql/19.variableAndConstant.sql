-- PL/pgSQL Variables
-- Before using a variable, you must declare it in the declaration section of the PL/pgSQL block.
do $$ 
declare
   counter    integer := 1;
   first_name varchar(50) := 'John';
   last_name  varchar(50) := 'Doe';
   payment    numeric(11,2) := 20.5;
   created_at time := now();
begin 
   raise notice '% % % has been paid % USD', 
       counter, 
	   first_name, 
	   last_name, 
	   payment;
end $$;

-- Copying data types
do $$ 
declare
   film_title film.title%type;
   featured_title film_title%type;
begin 
   -- get title of the film id 100
   select title
   from film
   into film_title
   where film_id = 100;
   
   -- show the film title
   raise notice 'Film title id 100: %s', film_title;
end; $$

-- This example declared two variables:
--      The film_title variable has the same data type as the title column in the film table from the sample database.
--      The featured_title has the same data type as the data type of the film_title variable.
-- By using type copying feature, you get the following advantages:
--      First, you don’t need to know the type of the column or reference that you are referencing.
--      Second, if the data type of the referenced column name (or variable) changes, you don’t need to change the definition of the function.
--
-- Variables in block and subblock
do $$ 
<<outer_block>>
declare
  counter integer := 0;
begin
   counter := counter + 1;
   raise notice 'The current value of the counter is %', counter;

   declare
       counter integer := 0;
   begin
       counter := counter + 10;
       raise notice 'Counter in the subblock is %', counter;
       raise notice 'Counter in the outer block is %', outer_block.counter;
   end;

   raise notice 'Counter in the outer block is %', counter;
   
end outer_block $$;

-- NOTICE:  The current value of the counter is 1
-- NOTICE:  Counter in the subblock is 10
-- NOTICE:  Counter in the outer block is 1
-- NOTICE:  Counter in the outer block is 1
--
-- PL/pgSQL Select Into statement
-- The select into statement allows you to select data from the database and assign the data to a variable.
do $$
declare
   actor_count integer; 
begin
   -- select the number of actors from the actor table
   select count(*)
   into actor_count
   from actor;

   -- show the number of actors
   raise notice 'The number of actors: %', actor_count;
end; $$

-- PL/pgSQL Row Types
-- how to use the PL/pgSQL row types to declare row variables that hold a complete row of a result set.
-- To store the whole row of a result set returned by the select into statement, you use the row-type variable or row variable.
do $$
declare
   selected_actor actor%rowtype;
begin
   -- select actor with id 10   
   select * 
   from actor
   into selected_actor
   where actor_id = 10;

   -- show the number of actor
   raise notice 'The actor name is % %',
      selected_actor.first_name,
      selected_actor.last_name;
end; $$

-- PL/pgSQL Constants
-- Unlike a variable, the value of a constant cannot be changed once it initialized.
do $$ 
declare
   vat constant numeric := 0.1;
   net_price    numeric := 20.5;
begin
   raise notice 'The selling price is %', net_price * ( 1 + vat );
end $$;























































