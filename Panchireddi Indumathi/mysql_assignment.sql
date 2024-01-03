
-- 1.  Return unique records from every column
select distinct country_id from countries; 
select distinct country_name from countries;
select distinct region_id from countries;
select distinct * from countries;
select distinct employee_id from job_history;
select distinct start_date from job_history;
select distinct  end_date from job_history;
select distinct  job_id from job_history;
select distinct department_id from job_history;
select distinct * from job_history;
select distinct employee_id from employees;
select distinct first_name from employees;
select distinct  last_name from employees;
select distinct email from employees;
select distinct phone_number from employees;
select distinct hire_date from employees;
select distinct job_id from employees;
select distinct salary from employees;
select distinct  commission_pct from employees;
select distinct manager_id from employees;
select distinct department_id from employees; 
select distinct  location_id from locations;
select distinct street_address from locations;
select distinct postal_code from locations;
select distinct  city from locations;
select distinct state_province from locations;
select distinct country_id from locations;
select distinct  job_id from jobs;
select distinct job_title from jobs;
select distinct min_salary from jobs;
select distinct max_salary from jobs;
select distinct department_id from departments;
select distinct department_name from departments;
select distinct manager_id from departments;
select distinct location_id from departments;
select distinct region_id from regions;
select distinct region_name from regions;


-- 2. Write queries on Aggregate functions

select sum(salary) from employees;
select avg(salary) from employees;
select count(department_name) from departments;
select count(postal_code) from locations;
select max(salary) from employees;
select max(job_id) from job_history;
select min(salary) from employees;

-- 3. Write a query in SQL to display the first_name and last_name, department_id and
-- salary from employees Table who earn more than 20000.( 'Steven', 'King', '90',
-- '24000.00')

select first_name,last_name,department_id,salary from employees where salary>20000;



-- 4. Write a query in SQL to display the first_name and last_name, email, salary and
-- manager_ID for those employees whose managers_ID is 120, 103 or 145.(18 rows)

select first_name,last_name,email,salary,manager_id from employees where manager_id=120 or manager_id=103 or manager_id=145;

-- 5. Write a query in SQL to display the first_name and last_name, department_id and
-- salary from employees Table who earn more than 8000 And whose managers_ID is
-- 120, 103 or 145.(3 rows)
 
select first_name,last_name,email,salary,manager_id from employees where (salary>8000 )and  (manager_id=120 or manager_id=103 or manager_id=145);

-- 6. Write a query to display all the locations (id, city) which do not have any state province
-- mentioned. (6 rows) [NOTE: LOCATION TABLE]

select * from locations where state_province is null;

-- 7. Write a query to display job_id, job titles, min_salary, max_salary whose maximum
-- salary is greater than 10000. (9 rows) [NOTE: JOBS TABLE]

select * from jobs where max_salary>10000;

-- 8. Write a query to display department_id,department_name, Manager_id whose
-- manager_id is greater than 200 and location_id is 2400.(1 row) [NOTE :
-- DEPARTMENTS TABLE]

select department_id,department_name,manager_id from  departments where manager_id>200 and location_id=2400;

-- 9. Write a query to display the job title whose minimum salary is greater than 8000 and
-- max salary less than 20000 (3 rows).[NOTE : JOBS TABLE]

select job_title from jobs where min_salary>8000 and max_salary<20000;

-- 10. Write a query to retrieve all the records of departments with managers for the location
-- id 1700. (5 rows) [NOTE : DEPARTMENTS TABLE]

select * from departments where manager_id is not null and location_id=1700 ;

-- 11. List all departments starting with “P” where there are managers.(2
-- rows)[NOTE:DEPARTMENT TABLE]

select department_name from departments where manager_id is not null and department_name like 'p%';

-- 12. Print a bonafide certificate for an employee (say for emp. id 123) as below:
-- #"This is to certify that <full name> with employee id <emp. id> is working as <job id> in
-- dept. <dept ID>. (1 ROW) [NOTE : EMPLOYEES table].
select 'This is to certify that' || first_name || last_name || 'with employee id' || employee_id ||'is working as' || job_id || 'in dept.' || department_id from employees where employee_id=123;

-- 13. Write a query to display the employee id, salary & salary range of employees as 'Tier1',
-- 'Tier2' or 'Tier3' as per the range <5000, 5000-10000, >10000 respectively, ordering the
-- output by those tiers.(107 ROWS)[NOTE :EMPLOYEES TABLE]

select employee_id,salary,
 case 
    when salary<5000 then 'Tier1'
    when salary>5000 and salary<=10000 then 'Tier2'
    when salary>10000 then 'Tier3'
 
 end  as salary_range from employees order by salary_range;

-- 14. Write a query to display the department-wise and job-id-wise total salaries of
-- employees whose salary is more than 25000.(8 rows) [NOTE : EMPLOYEES TABLE]

select department_id,job_id, sum(salary) as total_salary from employees where salary>25000  group by department_id ,Job_id  ;

-- 15. Write a query to display names of employees whose first name as well as last name ends
-- with vowels. (vowels : aeiou ) (5 rows) [NOTE : EMPLOYEES TABLE]

select first_name,last_name from employees where (first_name like '%a' or first_name like '%e' or first_name like '%i' or first_name like '%o' or first_name like '%u') and (last_name like '%a' or last_name like '%e' or last_name like '%i' or last_name like '%o' or last_name like '%u');


-- 16. What is the average salary range (diff. between min & max salary) of all types 'Manager's
-- and 'Clerk's. (9 rows)[NOTE : JOBS TABLE]
select * from jobs;
select max_salary - min_salary from jobs where job_title like '%Manager' or job_title like '%Clerk';

 
-- 17. Write a query to list the names of all people who report to the same person in
-- department Accounting (i.e.2).
select first_name from employees   group by department_id, manager_id;
 
 
 
-- 18. Write a query in SQL to display the first name, last name, department number,
-- and department name for each employee. (106 rows)

select e.first_name,e.last_name,e.department_id,d.department_name from employees e,departments d where e.department_id =d.department_id;

-- 19. Write a query in SQL to display the name of the department, average salary and
-- number of employees working in that department who got commission. (One row)
 
select d.department_name,((j.min_salary+j.max_salary)/2) as average_salary ,count(e.employee_id) from employees e,departments d,jobs j where e.department_id=d.department_id and e.job_id=j.job_id and commission_pct is not null;

-- 20. Display the first name where commission percentage is not provided. (72 rows)

 
select  first_name from employees where commission_pct is null;

-- 21. Display first_name , commission and where commission is null print 'Its Null'
-- otherwise print 'It’s not null' (107 Rows)
 
select first_name, case
                    when commission_pct is null then 'Its Null'
                    else 'Its not null'
                    end as commission
                    from employees;

