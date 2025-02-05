-- Group By
-- When you use the GROUP BY clause in a MySQL query, it groups together rows that have the same values in the specified column or columns.
-- GROUP BY is going to allow us to group rows that have the same data and run aggregate functions on them

select *
from employee_demographics;

select gender, avg(age)
from employee_demographics
group by gender
;


select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender
;

-- Order By is sorting a list to be in a particular order, either ascending or descending order
select *
from employee_demographics
order by gender, age
;







