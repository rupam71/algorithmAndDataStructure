-- A PostgreSQL trigger is a function invoked automatically whenever an event such as insert, update, or delete occurs.
-- PostgreSQL provides two main types of triggers:
--      Row-level triggers
--      Statement-level triggers.
-- The differences between the two kinds are how many times the trigger is invoked and at what time.
-- For example, if you issue an UPDATE statement that modifies 20 rows, the row-level trigger will be invoked 20 times, while the statement-level trigger will be invoked 1 time.
--
-- Triggers are useful in case the database is accessed by various applications, and you want to keep the cross-functionality within the database that runs automatically whenever the data of the table is modified. For example, if you want to keep the history of data without requiring the application to have logic to check for every event such as INSERT or UDPATE.
-- Also, you can use triggers to maintain complex data integrity rules which cannot implement elsewhere except at the database level. For example, when a new row is added into the customer table, other rows must be also created in tables of banks and credits.
--
-- The main drawback of using a trigger is that you must know the trigger exists and understand its logic to figure out the effects when data changes.
--
-- CREATE TRIGGER
-- a trigger function does not take any arguments and has a return value with the type trigger.
CREATE FUNCTION trigger_function() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   -- trigger logic
END;
$$
-- Once you define a trigger function, you can bind it to one or more trigger events such as INSERT, UPDATE, and DELETE.
-- The CREATE TRIGGER statement creates a new trigger. The following illustrates the basic syntax of the CREATE TRIGGER statement:
CREATE TRIGGER trigger_name 
   {BEFORE | AFTER} { event }
   ON table_name
   [FOR [EACH] { ROW | STATEMENT }]
       EXECUTE PROCEDURE trigger_function
-- In this syntax:
-- First, specify the name of the trigger after the TRIGGER keywords.
-- Second, specify the timing that cause the trigger to fire. It can be BEFORE or AFTER an event occurs.
-- Third, specify the event that invokes the trigger. The event can be INSERT , DELETE, UPDATE or TRUNCATE.
-- Fourth, specify the name of the table associated with the trigger after the ON keyword.
-- Fifth, specify the type of triggers which can be:
--      Row-level trigger that is specified by the FOR EACH ROW clause.
--      Statement-level trigger that is specified by the FOR EACH STATEMENT clause.
-- A row-level trigger is fired for each row while a statement-level trigger is fired for each transaction.
-- Finally, specify the name of the trigger function after the EXECUTE PROCEDURE keywords.
-- example
CREATE OR REPLACE FUNCTION log_last_name_changes()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
	IF NEW.last_name <> OLD.last_name THEN
		 INSERT INTO employee_audits(employee_id,last_name,changed_on)
		 VALUES(OLD.id,OLD.last_name,now());
	END IF;

	RETURN NEW;
END;
$$
-- The OLD represents the row before update while the NEW represents the new row that will be updated.
CREATE TRIGGER last_name_changes
  BEFORE UPDATE
  ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE log_last_name_changes();

-- DROP TRIGGER
DROP TRIGGER username_check
ON staff;

-- ALTER TRIGGER
-- The ALTER TRIGGER statement allows you to rename a trigger.
ALTER TRIGGER before_update_salary
ON employees
RENAME TO salary_before_update;

-- view all triggers associated with a table using the \dS command:
--
-- Disable a Triggers
ALTER TABLE employees
DISABLE TRIGGER log_last_name_changes;

-- disable all triggers associated with the employees table
ALTER TABLE employees
DISABLE TRIGGER ALL;

-- Enable a Triggers
ALTER TABLE employees
ENABLE TRIGGER salary_before_update;

-- enables all triggers that belong to the employees table
ALTER TABLE employees
ENABLE TRIGGER ALL;
