-- CASE STATEMENT Allows you to add logic in your select statement (IF ELSE) statement

select first_name, 
last_name,
age,
case
	when age <= 30 then 'young'
    WHEN AGE between 31 and 50 then 'old'
    when age >= 50 then 'on death door'
    end as AGE_BRACKET
from employee_demographics
;

-- Pay increase and Bonus 
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% Bonus 

SELECT first_name, last_name, salary,
case
	when salary < 50000 then salary * 1.05
    when salary > 50000 then salary * 1.07
end as New_Salary,
case 
	when dept_id = 6 then salary * 1.1
end as Bonus
FROM employee_salary
;

select *
from employee_salary
;
select *
from parks_departments
;





