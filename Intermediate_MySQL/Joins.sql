-- Joins 

select *
from employee_demographics
;

select *
from employee_salary
;

select dem.employee_id, age, occupation
from employee_demographics as DEM
inner join employee_salary as SAL
    on dem.employee_id = sal.employee_id
;

-- Outer Joins 
-- For outer joins we have a lft outer joins and a right outer joins 
-- As left joins will take everything from the left table even if there is no match on the join, and then it will only return the matches from the right table

select *
from employee_demographics as DEM
right outer join employee_salary as SAL
    on dem.employee_id = sal.employee_id
;

-- Self Join
-- This is a join when you tie the table to itself

select emp1.employee_id SANTA,
emp1.first_name FN_SANTA,
emp1.last_name LN_SANTA,
emp2.employee_id SANTA,
emp2.first_name FN_SANTA,
emp2.last_name LN_SANTA
from employee_salary AS emp1
join employee_salary as emp2
	on emp1.employee_id + 1 = emp2.employee_id
;

-- JOINING MULTIPLE TABLES TOGETHER

select *
from employee_demographics as DEM
inner join employee_salary as SAL
    on dem.employee_id = sal.employee_id
inner join parks_departments pd
	on sal.dept_id = pd.department_id
;

select *
from parks_departments;








