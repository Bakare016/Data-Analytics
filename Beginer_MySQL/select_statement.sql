-- SELECT STATEMENET

select *
from EMPLOYEE_demographics;

select first_name,
last_name, 
 birth_date,
 age,
 10*(age+10) + 10
from EMPLOYEE_demographics;

#See how it's pretty easy to read and to see which columns we are using.
#PEMDAS
#Math in SQL does follow PEMDAS which stands for Parenthesis, Exponent, Multiplication,
#Division, Addition, subtraction - it's the order of operation for math

select distinct first_name, gender
from employee_demographics;




