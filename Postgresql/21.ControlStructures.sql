-- PL/pgSQL provides you with three forms of the if statements.
-- if then
if not found then
     raise notice'The film % could not be found', 
	    input_film_id;
-- if then else
if not found then
     raise notice 'The film % could not be found', 
	    input_film_id;
  else
     raise notice 'The film title is %', selected_film.title;
  end if;
-- if then elsif
if v_film.length >0 and v_film.length <= 50 then
		 len_description := 'Short';
	  elsif v_film.length > 50 and v_film.length < 120 then
		 len_description := 'Medium';
	  elsif v_film.length > 120 then
		 len_description := 'Long';
	  else 
		 len_description := 'N/A';
	  end if;

-- PL/pgSQL Loop statement
-- The loop defines an unconditional loop that executes a block of code repeatedly until terminated by an exit or return statement.
do $$
declare
   n integer:= 10;
   fib integer := 0;
   counter integer := 0 ; 
   i integer := 0 ; 
   j integer := 1 ;
begin
	if (n < 1) then
		fib := 0 ;
	end if; 
	loop 
		exit when counter = n ; 
		counter := counter + 1 ; 
		select j, i + j into i,	j ;
	end loop; 
	fib := i;
    raise notice '%', fib; 
end; $$

-- PL/pgSQL while loop
-- The while loop statement executes a block of code until a condition evaluates to false.
do $$
declare 
   counter integer := 0;
begin
   while counter < 5 loop
      raise notice 'Counter %', counter;
	  counter := counter + 1;
   end loop;
end$$;

-- PL/pgSQL for loop to iterate over a range of integers
do $$
begin
   for counter in 1..5 loop
	raise notice 'counter: %', counter;
   end loop;
end; $$

-- The exit statement allows you to terminate a loop including an unconditional loop, a while loop, and a for loop.
-- The continue statement prematurely skips the current iteration of the loop and jumps to the next one. 








