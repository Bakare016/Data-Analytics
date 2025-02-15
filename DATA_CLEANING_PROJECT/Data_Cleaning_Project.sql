-- Data Cleaning Project
-- Data cleaning in MySQL is the process of identifying, correcting, and removing errors, inconsistencies, and inaccuracies from a database
-- to improve data quality and reliability. This includes:
-- Handling missing or null values
-- Removing duplicates
-- Correcting formatting errors
-- Standardizing data formats
-- Removing irrelevant data


select *
from layoffs;

-- Step No1. Remove Duplicates
-- Step No2. Standardize the data (Issues with spellings)
-- Step No3. Look for Null values and Blank values
-- Step No4. Remove any columns or rows that aren't neccessary

create table layoffs_staging
like layoffs;

select *
from layoffs_staging;

insert layoffs_staging
select *
from layoffs;

-- The above is just to create a duplicate table (layoffs_staging), so we don't have to work on the raw data table (layoffs)

-- Removing Duplicates

select *,
row_number() over(
partition by company, industry, total_laid_off, percentage_laid_off, `date`) as row_num
from layoffs_staging;

with duplicate_cte as 
(
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, 
country, funds_raised_millions) as row_num
from layoffs_staging
)
select *
from duplicate_cte
where row_num > 1;

select *
from layoffs_staging
where company = 'Casper';

with duplicate_cte as 
(
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, 
country, funds_raised_millions) as row_num
from layoffs_staging
)
delete
from duplicate_cte
where row_num > 1;


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2
where row_num > 1;

insert into layoffs_staging2
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, 
country, funds_raised_millions) as row_num
from layoffs_staging;

delete
from layoffs_staging2
where row_num > 1;

select *
from layoffs_staging2;

-- Standardizing Data

select company, trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company);

select distinct industry
from layoffs_staging2
;

update layoffs_staging2
set industry = 'crypto'
where industry like 'crypto%';

select distinct country, trim(trailing '.' from country) -- Trailing will remove the dot(.) from the United states. 
from layoffs_staging2
order by 1
;

update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'United States%';

-- Let's set the date to date column

select `date`
from layoffs_staging2;


update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y')
;

alter table layoffs_staging2
modify column `date` date;

select *
from layoffs_staging2;

-- Working with Nulls and Blank values 

select *
from layoffs_staging2
where total_laid_off is Null
and percentage_laid_off is null
;

update layoffs_staging2
set industry = null
where industry = '';

select *
from layoffs_staging2
where industry is null
or industry = '';


select *
from layoffs_staging2
where company like 'Bally%';

select t1.industry, t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
where (t1.industry is NULL or t1.industry = '')
and t2.industry is not NULL;

update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is NULL
and t2.industry is not NULL;

select *
from layoffs_staging2;


select *
from layoffs_staging2
where total_laid_off is Null
and percentage_laid_off is null;


delete 
from layoffs_staging2
where total_laid_off is Null
and percentage_laid_off is null;


select *
from layoffs_staging2;

alter table layoffs_staging2
drop column row_num;







