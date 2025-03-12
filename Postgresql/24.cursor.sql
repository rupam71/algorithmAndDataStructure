-- PL/pgSQL Cursor
-- A PL/pgSQL cursor allows you to encapsulate a query and process each individual row at a time.
-- Typically, you use cursors when you want to divide a large result set into parts and process each part individually. If you process it at once, you may have a memory overflow error.
--
-- how to use a cursor in PostgreSQL:
--  First, declare a cursor.
declare
    cur_films  cursor for 
		select * 
		from film;
    cur_films2 cursor (year integer) for 
		select * 
		from film 
		where release_year = year;
--  Next, open the cursor.
open cur_films;
open cur_films2(year:=2005);
--  Then, fetch rows from the result set into a target.
--  After that, check if there is more row left to fetch. If yes, go to step 3, otherwise, go to step 5.
--  Finally, close the cursor.
close cursor_variable;

-- Using cursors
-- After opening a cursor, we can manipulate it using FETCH, MOVE, UPDATE, or DELETE statement.
-- Fetching the next row
fetch cur_films into row_film;
fetch last from row_film into title, release_year;
-- Moving the cursor
-- If you want to move the cursor only without retrieving any row, you use the MOVE statement. The direction accepts the same value as the FETCH statement.
move cur_films2;
move last from cur_films;
move relative -1 from cur_films;
move forward 3 from cur_films;
-- Deleting or updating the row
-- Once a cursor is positioned, we can delete or update row identifying by the cursor using DELETE WHERE CURRENT OF or UPDATE WHERE CURRENT OF statement as follows:
update film 
set release_year = p_year 
where current of cur_films;

-- PL/pgSQL cursors – putting it all together
-- The following get_film_titles(integer) function accepts an argument that represents the release year of a film. Inside the function, we query all films whose release year equals to the released year passed to the function. We use the cursor to loop through the rows and concatenate the title and release year of film that has the title contains the ful word.

create or replace function get_film_titles(p_year integer)
   returns text as $$
declare 
	 titles text default '';
	 rec_film   record;
	 cur_films cursor(p_year integer) 
		 for select title, release_year
		 from film
		 where release_year = p_year;
begin
   -- open the cursor
   open cur_films(p_year);
	
   loop
    -- fetch row into the film
      fetch cur_films into rec_film;
    -- exit when no more row to fetch
      exit when not found;

    -- build the output
      if rec_film.title like '%ful%' then 
         titles := titles || ',' || rec_film.title || ':' || rec_film.release_year;
      end if;
   end loop;
  
   -- close the cursor
   close cur_films;

   return titles;
end; $$

language plpgsql;

--

select get_film_titles(2006);