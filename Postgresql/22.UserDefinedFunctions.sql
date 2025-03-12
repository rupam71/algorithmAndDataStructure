-- create function
create function get_film_count(len_from int, len_to int)
returns int
language plpgsql
as
$$
declare
   film_count integer;
begin
   select count(*) 
   into film_count
   from film
   where length between len_from and len_to;
   
   return film_count;
end;
$$;

-- Function Parameter Modes: IN, OUT, INOUT
--
-- PL/pgSQL Function Overloading
-- If two or more functions share the same name, the function names are overloaded.
--
-- Develop a PL/pgSQL Function That Returns a Table
returns table ( column_list ) ;
create or replace function get_film (
  p_pattern varchar
) 
	returns table (
		film_title varchar,
		film_release_year int
	) 
	language plpgsql
as $$
begin
	return query 
		select
			title,
			release_year::integer
		from
			film
		where
			title ilike p_pattern;
end;$$

-- PostgreSQL Drop Function
-- To remove a user-defined function, you use the drop function statement:
drop function get_film_actors;
drop function get_film_actors, get_film_actors2;