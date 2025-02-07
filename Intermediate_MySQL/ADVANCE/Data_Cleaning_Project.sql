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




