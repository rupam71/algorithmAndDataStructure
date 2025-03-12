-- PostgreSQL CREATE PROCEDURE
-- A drawback of user-defined functions is that they cannot execute transactions. In other words, inside a user-defined function, you cannot start a transaction, and commit or rollback it.
-- A stored procedure does not return a value. You cannot use the return statement with a value inside a store procedure like this:
return expression;

-- PostgreSQL CREATE PROCEDURE statement examples
create or replace procedure transfer(
   sender int,
   receiver int, 
   amount dec
)
language plpgsql    
as $$
begin
    -- subtracting the amount from the sender's account 
    update accounts 
    set balance = balance - amount 
    where id = sender;

    -- adding the amount to the receiver's account
    update accounts 
    set balance = balance + amount 
    where id = receiver;

    commit;
end;$$

-- Calling a stored procedure
call transfer(1,2,1000);

-- PostgreSQL Drop Procedure
drop procedure insert_actor(varchar);

-- remove multiple procedure
drop procedure 
	delete_actor, 
	update_actor;
















