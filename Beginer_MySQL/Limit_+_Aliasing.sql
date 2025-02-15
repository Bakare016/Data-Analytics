-- Limit and Aliasing
-- This will specify how many rows you want in your output

Select *
from employee_demographics
order by age desc
limit 2, 1
;

-- Aliasing is just a way of changing the name of the column 

select gender, avg(age) bakare
from employee_demographics
group by gender
having avg(age) > 40
;

-- We see thst above column (avg age) was changed to Bakare.



