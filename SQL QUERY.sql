-- DATABASE AND TABLE MANAGEMENT

-- create the db - database 
create schema DataDB
-- use the database for further process
use DataDB
-- create table 
create table employees(
emp_ID INT PRIMARY KEY,   
Name VARCHAR(50),
Position VARCHAR(30),
Salary DECIMAL(10,2),
Hire_date DATE

)
-- view table in database 
show tables;
-- Alter table ( add column)
alter table employees add email VARCHAR(50);
-- Alter table (modify column)
alter table employees modify Salary DECIMAL (12,2);
-- delete a table 
drop table employees;


-- CRUD OPERATIONS ( Create, Read, Update, Delete)
-- create table 
create table employees(
emp_ID INT PRIMARY KEY,   
Name VARCHAR(50),
Position VARCHAR(30),
Salary DECIMAL(10,2),
Hire_date DATE
)

-- insert the values in the table 
INSERT INTO employees VALUES
(1, 'John Smith', 'Software Engineer', 75000.00, '2020-05-12'),
(2, 'Emily Johnson', 'Data Analyst', 68000.00, '2019-08-23'),
(3, 'Michael Brown', 'Project Manager', 90000.00, '2018-03-15'),
(4, 'Sophia Davis', 'HR Manager', 72000.00, '2021-01-05'),
(5, 'David Wilson', 'Database Administrator', 85000.00, '2017-06-19'),
(6, 'Olivia Miller', 'Business Analyst', 70000.00, '2020-11-10'),
(7, 'Daniel Anderson', 'System Architect', 95000.00, '2016-12-01'),
(8, 'Isabella Thomas', 'UX Designer', 65000.00, '2022-07-25'),
(9, 'James Taylor', 'Network Engineer', 78000.00, '2019-09-14'),
(10, 'Charlotte Moore', 'DevOps Engineer', 88000.00, '2021-04-20'),
(11, 'Lucas White', 'Software Engineer', 77000.00, '2022-03-14'),
(12, 'Ella Harris', 'Software Engineer', 80000.00, '2023-01-25'),
(13, 'Ethan Young', 'Data Analyst', 69000.00, '2020-09-10'),
(14, 'Ava Walker', 'Data Analyst', 71000.00, '2021-12-30'),
(15, 'Matthew Hall', 'HR Manager', 73000.00, '2019-05-18'),
(16, 'Abigail Allen', 'HR Manager', 76000.00, '2020-06-08'),
(17, 'Henry King', 'UX Designer', 67000.00, '2023-04-12'),
(18, 'Amelia Scott', 'UX Designer', 66000.00, '2021-09-29'),
(19, 'Jack Wright', 'Project Manager', 92000.00, '2022-02-15'),
(20, 'Scarlett Green', 'Project Manager', 91000.00, '2020-07-19'),
(21, 'Mason Baker', 'DevOps Engineer', 87000.00, '2019-11-27'),
(22, 'Lily Adams', 'DevOps Engineer', 86000.00, '2022-05-06');

-- Read 
select * from employees;
select Name from employees;
-- update 
update employees set Salary = 55000 where emp_ID = 1;

-- delete 
delete from employees;

-- FILTERING AND SORTING 
-- Comparison operators =, <, >, <=, >=, <>, BETWEEN, IN, LIKE, IS NULL 
select * from employees where Position = "HR manager"; 
select * from employees where Salary > 50000;
select * from employees where Salary < 70000; 
select * from employees where Hire_date <="2020-01-01";
select * from employees where Salary >=85000;
select * from employees where position <> "Project Manager";  -- not a project manager 
select * from employees where salary between 70000 and 80000;
select * from employees where Position in ("Software Engineer","Project Manager","DevOps Engineer");
-- logical operator AND OR NOT  
select * from employees where position = "Software Engineer" and Salary > 50000;
select * from employees where position = "Data Analyst" or Salary > 90000;
select * from employees where not position = "Project Manager";
-- like 
select * from employees where Position like "D%"; -- name starts with D
select * from employees where Name like "%R"; -- last letter
select * from employees where Name like "%T_"; -- 2nd last letter using _ 
select * from employees where Hire_date IS NULL;
-- Order by
select * from employees order by Salary desc;
select * from employees order by Salary ASC;
select * from employees order by Salary;
-- Limit 
select * from employees limit 5;
select * from employees limit 2,1; -- 1 is limit 2 is offset
select * from employees limit 1 offset 5;

-- AAGREGATE FUNCTION
select count(*) from employees;
select avg(salary) as average_salary from employees;
select max(salary) from employees;
select min(salary) from employees;
select sum(salary) from employees;

-- GROUPING 
select position from employees group by position;
select position, avg(salary) from employees group by position;
select position,count(*) from employees group by position having count(*) > 2;

-- JOINS 
-- create another table related to employee table 
create table depart(
dept_ID int primary key,
dept_name varchar(50),
location varchar(50))

-- insert values
INSERT INTO depart VALUES
(101, 'IT', 'New York'),
(102, 'Analytics', 'Chicago'),
(103, 'Management', 'Boston'),
(104, 'HR', 'Los Angeles'),
(105, 'Infrastructure', 'Houston'),
(106, 'Design', 'Seattle'),
(107, 'DevOps', 'San Francisco');

-- add the department id 
alter table employees add dept_ID INT;
-- Update employees with the department ID
update employees set dept_id = 101 where position in ("Software Engineer", "System Architect");
UPDATE employees SET dept_id = 102 WHERE position IN ('Data Analyst', 'Business Analyst');
UPDATE employees SET dept_id = 103 WHERE position = 'Project Manager';
UPDATE employees SET dept_id = 104 WHERE position = 'HR Manager';
UPDATE employees SET dept_id = 105 WHERE position IN ('Database Administrator', 'Network Engineer');
UPDATE employees SET dept_id = 106 WHERE position = 'UX Designer';
UPDATE employees SET dept_id = 107 WHERE position = 'DevOps Engineer';
select * from employees;

-- JOINS 
-- inner joins  --> returns only the rows that have a match in both tables
select e.emp_id , e.name, e.position, d.dept_name, d.location from employees e
inner join depart d on e.dept_id = d.dept_id;
-- left joins --> returns all rows from employees and matchs from departments
select e.emp_id, e.name, e.position, d.dept_name,d.location
from employees e 
left join depart d on e.dept_id = d.dept_id;
-- right join --> returns all rows form departments and matchs form employees
select e.emp_id, e.name, e.position, d.dept_name,d.location
from employees e 
right join depart d on e.dept_id = d.dept_id;
-- full outer join --> returns all the rows form both table 
SELECT e.emp_id, e.name, e.position, d.dept_name, d.location
FROM employees e
LEFT JOIN depart d 
    ON e.dept_id = d.dept_id
UNION
SELECT e.emp_id, e.name, e.position, d.dept_name, d.location
FROM employees e
RIGHT JOIN depart d 
    ON e.dept_id = d.dept_id;
 
 -- SUBQUERIES
 select * from employees where salary > (select avg(salary) from employees);
 select name from employees where dept_ID in (select dept_id from depart where location="Seattle" );
 -- correlated subqueries
 select name, salary from employees e where salary > (
 select avg(salary) from employees where dept_id = e.dept_id
 )
 
 -- VIEWS
 create view high_salary_employees as select name, salary from employees where salary > 50000;
select * from high_salary_employees;
drop view high_salary_employees;

-- SORTED PROCEDURE
DELIMITER //
CREATE PROCEDURE GetEmployeeByID(IN empID INT)
BEGIN
    SELECT * FROM employees WHERE emp_id = empID;
END //
DELIMITER ;

CALL GetEmployeeByID(2);

-- FUNCTIONS 
create function getannualsalary (monthly_salary decimal(10,2))
returns decimal (10,2)
deterministic
return monthly_salary * 12;

select name, getannualsalary(salary) from employees;

-- TRIGGERS
create trigger before_insert_emp
before insert on employees
for each row
set new.hire_date = now();

-- TRANSACTIONS
start transaction;
update employees set salary = salary + 5000 where emp_id = 3;
delete from employees where emp_id = 4;
rollback; -- undo
commit; -- save

-- INDEXES 
create index idx_name on employees(name);

-- WINDOW FUNCTIONS 

-- ranking 
select name,salary, rank() over (order by salary desc) as rank_no from employees;
-- running total
select name,salary, sum(salary) over (order by emp_id) as running_total from employees;
-- partition by group 
select position,name,salary, avg(salary) over (partition by position) as average_by_position from employees;

-- COMMON TABLE EXPRESSIONS(CTE)
WITH HighPaid AS (
    SELECT * FROM employees WHERE salary > 50000
)
SELECT * FROM HighPaid;

-- TEMPORARY TABLES
create temporary table temp_emp as select * from employees;

-- CASE STATEMENT
select name,
case
when salary > 70000 then "high"
when salary between 40000 and 70000 then "median"
else "low"
end as salary_range
from employees;





