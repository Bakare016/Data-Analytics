-- String Functions

select length('skyfall')
;

select first_name, length(first_name)
from employee_demographics
order by 2
;

select upper('sky');

select first_name, upper(first_name)
from employee_demographics
;

-- Trim takes away all extra space from either left side (LTRIM) or right side (RTRIM). while TRIM eliminates spaces from both sides

select trim('    sky         ');

-- SUBSTRINGS

select first_name, left (first_name, 4),
right (first_name, 4),
substring (first_name, 3,2)
from employee_demographics
;

select first_name,
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2) as birth_month
from employee_demographics
;

-- Replace... This will replace a specific character with a different character that you want

select first_name, replace(first_name, 'A', 'z')
from employee_demographics
;

-- Locate 

select locate('x', 'Alexander');

select first_name, locate('An', first_name)
from employee_demographics
;

-- This one below (Concat) will merge names in different columns in one column

select first_name, last_name,
concat(first_name, ' ', last_name) as full_name
from employee_demographics
;




