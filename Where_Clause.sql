-- where clause 

select *
from employee_salary
where first_name = 'leslie';

select *
from employee_salary
where salary <= '50000'
;

select *
from employee_demographics
where gender != 'female'
;
# this (!=) refers to "not equal to"

select *
from employee_demographics
where birth_date > '1985-1-1'
;

-- Logical operators are "AND or NOT"

select *
from employee_demographics
where birth_date > '1985-1-1'
and gender = 'male'
;

select *
from employee_demographics
where (first_name = 'leslie' and age = 44) or birth_date > '1985-1-1'
;

-- like statement 
-- Like comes with a guess work and not the exact word from the data, so we can add the special character % or _
-- the % means anything and the _ means a specific value. lets see how it works below 
select *
from employee_demographics
where birth_date like '1989%'
;


