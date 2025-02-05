-- Window functions
-- windows functions are really powerful and are somewhat like a group by - except they don't roll everything up into 1 row when grouping. 
-- windows functions allow us to look at a partition or a group, but they each keep their own unique rows in the output
-- we will also look at things like Row Numbers, rank, and dense rank

select gender, avg(salary) as avg_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
;

-- Using a windows function as below, start by copying what we have up there, then paste it down

select dem.first_name, dem.last_name, gender, avg(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;

-- Lets try rolling over sum of salaries as below

select dem.first_name, dem.last_name, gender, salary,
sum(salary) over(partition by gender order by dem.employee_id) As Rolling_Total
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;


select dem.employee_id, dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender order by salary desc) as Row_Num, -- this doesn't give a duplicate
rank() over(partition by gender order by salary desc) as Rank_Num, -- this gives a duplicat, but does't continue numerically skipps and give the number according to it's position
dense_rank() over(partition by gender order by salary desc) as dense_Rank_Num -- this one give duplicate and does't continue numerically skipps and give the number serially after the duplicate number
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;















