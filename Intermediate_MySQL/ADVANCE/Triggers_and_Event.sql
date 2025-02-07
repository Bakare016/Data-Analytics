-- Triggers and Events

-- Triggers

-- a Trigger is a block of code that executes automatically when an event takes place in a table.

-- for example we have these 2 tables, invoice and payments - when a client makes a payment we want it to update the invoice field "total paid"
-- to reflect that the client has indeed paid their invoice

select *
from employee_demographics
;

select *
from employee_salary
;

-- So looking at these 2 tables, we don't have s/n2 in the demographics table, but we have s/n2 in the salary table, but we need it to
-- appear with the same information as (First name and Last name) in the demographics table, let's see the output below

DELIMITER $$
CREATE TRIGGER employee_insert1
	after insert on employee_salary
    for each row
begin 
	insert into employee_demographics (employee_id, first_name, last_name)
	values (new.employee_id, new.first_name, new.last_name);
end $$
delimiter ;

insert into employee_salary (employee_id, first_name, last_name, occupation,
salary, dept_id)
values(14, 'Bakare', 'Kehinde', 'civil engr', 1000000, null);


-- EVENTS
-- In MySQL, an event is a scheduled task that runs automatically at a specified time or interval. It's like a cron job, 
-- but within the database itself.
-- In MySQL, events are created using the CREATE EVENT statement. Here's a basic syntax:
-- Also note that a TRIGGER happens when an EVENTS takes place, whereas an EVENT takes place when it's scheduled

select *
from employee_demographics;

delimiter $$
create event delete_retirees
on schedule every 30 second
do
begin
	delete
	from employee_demographics
    where age >= 60;
end $$
delimiter ;

show variables like 'event%';