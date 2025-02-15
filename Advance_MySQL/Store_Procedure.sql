-- Store Procedure
-- This is used to save MySQL codes to be reused over and over again
-- You can call your store procedure and it will read all the codes youve saved in your store procedure
-- It's helpful for storing complex quaries 
-- Let's take a look at how we can create a store procedure

select *
from employee_salary
where salary >= 50000
;
-- we are going to save the above complex code within a store precedure as below

create procedure large_salaries ()
select *
from employee_salary
where salary >= 50000
;

call large_salaries(); 
-- the above is used to call what is saved in the stored procedure e.g (Large_Salaries)

-- Using store procedures with multiple queries using a DELIMITER $$

DELIMITER $$
create procedure large_salaries3()
BEGIN
	select *
	from employee_salary
	where salary >= 50000;
	select *
	from employee_salary
	where salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries();

-- New we will look at PERIMETER. They are variables that allows inputs values and create it in your code

DELIMITER $$
create procedure large_salaries5(Bak_employee_id int)
BEGIN
	select salary
	from employee_salary
    where employee_id = Bak_employee_id
    ;
END $$
DELIMITER ;

call large_salaries5(1)







