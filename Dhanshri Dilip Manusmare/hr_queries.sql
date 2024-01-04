use hr;

-- 1. Return unique records from every column 

select distinct employee_id from emp_details_view;
select distinct job_id from emp_details_view;
select distinct manager_id from emp_details_view;
select distinct department_id from emp_details_view;
select distinct location_id from emp_details_view;
select distinct country_id from emp_details_view;
select distinct first_name from emp_details_view;
select distinct last_name from emp_details_view;
select distinct salary from emp_details_view;
select distinct commission_pct from emp_details_view;
select distinct department_name from emp_details_view;
select distinct job_title from emp_details_view;
select distinct city from emp_details_view;
select distinct state_province from emp_details_view;
select distinct country_name from emp_details_view;
select distinct region_name from emp_details_view;


-- 2. Write queries on Aggregate functions

-- COUNT
select count(*) from emp_details_view;
-- SUM
select sum(salary) from emp_details_view;
-- AVG 
select avg(salary) from emp_details_view;
-- MIN
select min(salary) from emp_details_view;
-- MAX
select max(salary) from last_name, department_id ;
 
-- 3. Write a query in SQL to display the first_name and last_name, department_id and
-- salary from employees Table who earn more than 20000.( 'Steven', 'King', '90','24000.00')

select first_name,last_name, department_id,salary from emp_details_view where salary > 20000;

-- 4. Write a query in SQL to display the first_name and last_name, email, salary and
-- manager_ID for those employees whose managers_ID is 120, 103 or 145.(18 rows)

select first_name,last_name,salary, manager_id from emp_details_view where manager_id in (120,103,145);

-- 5. Write a query in SQL to display the first_name and last_name, department_id and
-- salary from employees Table who earn more than 8000 And whose managers_ID is 120, 103 or 145.(3 rows)

select first_name,last_name,salary, manager_id from emp_details_view where salary>8000 and manager_id in (120,103,145);

-- 6. Write a query to display all the locations (id, city) which do not have any state province
-- mentioned. (6 rows) [NOTE: LOCATION TABLE]

select location_id,city from locations where state_province is null ;

-- 7. Write a query to display job_id, job titles, min_salary, max_salary whose maximum
-- salary is greater than 10000. (9 rows) [NOTE: JOBS TABLE]

select job_id, job_title, min_salary, max_salary from jobs where max_salary > 10000;

-- 8. Write a query to display department_id,department_name, Manager_id whose
-- manager_id is greater than 200 and location_id is 2400.(1 row) [NOTE :DEPARTMENTS TABLE]

select department_id,department_name, Manager_id from departments where manager_id > 200 and location_id = 2400;

-- 9. Write a query to display the job title whose minimum salary is greater than 8000 and
-- max salary less than 20000 (3 rows).[NOTE : JOBS TABLE]

select * from jobs;
select job_title from jobs where min_salary>8000 and max_salary<20000;

-- 10. Write a query to retrieve all the records of departments with managers for the location
-- id 1700. (5 rows) [NOTE : DEPARTMENTS TABLE]
 
 select * from departments where location_id = 1700 and manager_id is not null;

-- 11. List all departments starting with “P” where there are managers.(2 rows)[NOTE:DEPARTMENT TABLE]

select * from departments;
select department_name from departments where department_name like "p%" ;

-- 12. Print a bonafide certificate for an employee (say for emp. id 123) as below: #"This is to certify
-- that <full name> with employee id <emp. id> is working as <job id> in dept. <dept ID>. (1 ROW) [NOTE : EMPLOYEES table].

Select * from employees;
SELECT 
    CONCAT('This is to certify that ',
           first_name, ' ', last_name,
           ' with employee ID ', employee_id,
           ' is working as ', job_id,
           ' in department ', department_id,
           '.') AS bonafide_certificate
FROM employees
WHERE employee_id = 123;

-- 13. Write a query to display the employee id, salary & salary range of employees as 'Tier1',
-- 'Tier2' or 'Tier3' as per the range <5000, 5000-10000, >10000 respectively, ordering the
-- output by those tiers.(107 ROWS)[NOTE :EMPLOYEES TABLE]

select employee_id,salary,
case
when salary < 5000 then "Tier1"
when salary between 5000 and 10000 then "Tier2"
else "Tier3"
end as salary_range
from employees order by salary_range;


-- 14. Write a query to display the department-wise and job-id-wise total salaries of
-- employees whose salary is more than 25000.(8 rows) [NOTE : EMPLOYEES TABLE]

select * from employees;
select department_id,job_id, sum(salary) as total_salary from employees where salary> 25000 group by job_id, department_id;
    
-- 15. Write a query to display names of employees whose first name as well as last name ends
-- with vowels. (vowels : aeiou ) (5 rows) [NOTE : EMPLOYEES TABLE]

SELECT first_name, last_name
FROM employees
WHERE first_name REGEXP '[aeiou]$' AND last_name REGEXP '[aeiou]$';

-- 16. What is the average salary range (diff. between min & max salary) of all types 'Manager's
-- and 'Clerk's. (9 rows)[NOTE : JOBS TABLE]

select * from jobs;
select job_title, avg(max_salary - min_salary) as avg_salary from jobs
where job_title like '%Manager' or  job_title like '%Clerk' group by job_title;

-- 17. Write a query to list the names of all people who report to the same person in
-- department Accounting (i.e.2).

SELECT e1.*
FROM emp_details_view e1
JOIN emp_details_view e2 ON e1.employee_id = e2.employee_id
WHERE e1.department_name = 'Accounting'
  AND e2.department_name = 'Accounting';

-- 18. Write a query in SQL to display the first name, last name, department number,
-- and department name for each employee. (106 rows)

select first_name, last_name, department_id, department_name from emp_details_view;

-- 19. Write a query in SQL to display the name of the department, average salary and
-- number of employees working in that department who got commission. (One row)

select * from emp_details_view ;
select department_name,avg(salary) from emp_details_view where commission_pct is not null group by department_name ;

-- 20. Display the first name where commission percentage is not provided. (72 rows)

select first_name from emp_details_view where commission_pct is null;
select count(first_name) from emp_details_view where commission_pct is null;

-- 21. Display first_name , commission and where commission is null print 'Its Null'
-- otherwise print 'It’s not null' (107 Rows)

select first_name,commission_pct,
case
when commission_pct is null then "Its Null"
else "Its not null"
end as commission
from emp_details_view;
