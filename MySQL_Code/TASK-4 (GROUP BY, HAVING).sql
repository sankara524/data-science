-- SQL - Task-4: Group by, Having

-- Create database and use it 
CREATE DATABASE company_2;

USE company_2;

-- Create employees table
CREATE TABLE employees (
    ID INT PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    AGE INT,
    DATE_OF_JOINING DATE,
    SALARY DECIMAL(12,2),
    DEPARTMENT VARCHAR(50)
);

-- Insert sample data for the assignment
INSERT INTO employees (ID, NAME, AGE, DATE_OF_JOINING, SALARY, DEPARTMENT) VALUES
(1001, 'PRIYA',   28, '2024-08-11',  50000.00, 'IT'),
(1002, 'VARSHA',  27, '2025-06-15',  60000.00, 'FINANCE'),
(1003, 'SNEHA',   22, '2025-08-26',  40000.00, 'HR'),
(1004, 'DHEERAJ', 31, '2022-06-15',  80000.00, 'FINANCE'),
(1005, 'VINEELA', 28, '2025-08-11',  50000.00, 'IT'),
(1006, 'VIKAS',   35, '2014-03-01', 120000.00, 'SALES'),
(1007, 'VINOD',   29, '2021-07-10',  70000.00, 'SALES'),
(1008, 'ANIL',    45, '2010-01-05',  90000.00, 'HR'),
(1009, 'RAJ',     26, '2023-04-20',  30000.00, 'IT'),
(1010, 'MAYA',    32, '2018-11-30',  75000.00, 'FINANCE'),
(1011, 'VIMAL',   25, '2024-08-11',  45000.00, 'IT'),
(1012, 'SARA',    24, '2022-06-15',  20000.00, 'HR'),
(1013, 'TOM',     40, '2009-09-12',  40000.00, 'MANAGEMENT'),
(1014, 'RAMESH',  50, '2012-05-20', 110000.00, 'MANAGEMENT');


-- 1. The Department Headcount
-- Find the total number of employees in each department. Display the department name and the count.
SELECT DEPARTMENT, COUNT(*) AS TOTAL_EMPLOYEES
FROM EMPLOYEES
GROUP BY DEPARTMENT;

-- 2. High Earners Club
-- Find the average salary for each department, but only display those departments where the average salary is above 50,000.
SELECT DEPARTMENT, AVG(SALARY) AS AVERAGE_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 50000;

-- 3. The Seniority Check
-- For each department, find the age of the youngest employee. Rename the result column to Youngest_Staff.
SELECT DEPARTMENT, MIN(AGE) AS YOUNGEST_STAFF
FROM EMPLOYEES
GROUP BY DEPARTMENT;

-- 4. Busy Hiring Dates
-- Identify any DATE_OF_JOINING where more than one employee joined the company on that same day.
SELECT DATE_OF_JOINING, COUNT(*) AS TOTAL_EMPLOYEES
FROM EMPLOYEES
GROUP BY DATE_OF_JOINING
HAVING COUNT(*) > 1;

-- 5. Small Teams Only
-- List the departments that have fewer than 2 employees.
SELECT DEPARTMENT, COUNT(*) AS TOTAL_EMPLOYEES
FROM EMPLOYEES
GROUP BY DEPARTMENT
HAVING COUNT(*) < 2;

-- 6. Experienced Departments
-- Find the average age of employees in each department, but exclude any employee named 'SNEHA' from the calculation.
SELECT DEPARTMENT, AVG(SALARY) AS AVERAGE_AGE
FROM EMPLOYEES
WHERE NAME != 'SNEHA'
GROUP BY DEPARTMENT;

-- 7. Salary Range Analysis
-- For each department, calculate the difference between the Maximum salary and the Minimum salary. Display this as Salary_Gap.
SELECT DEPARTMENT, MAX(SALARY) - MIN(SALARY) AS SALARY_GAP
FROM EMPLOYEES
GROUP BY DEPARTMENT;

-- 8. The "V" Name Filter
-- Count how many employees have names starting with the letter 'V', per each department.
SELECT DEPARTMENT, COUNT(*) AS V_NAME_COUNT
FROM EMPLOYEES
WHERE NAME LIKE 'V%'
GROUP BY DEPARTMENT;

-- 9. Mid-Career Department Totals
-- Find the total salary (SUM) paid to employees in each department, but only include employees who are between the ages of 25 and 30.
SELECT DEPARTMENT, SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
WHERE AGE BETWEEN 25 AND 30
GROUP BY DEPARTMENT;

-- 10. The Final Audit
-- Display the department name and the total salary spent, but only for departments that have at least 2 employees and where the total salary spent is greater than 90,000.
SELECT DEPARTMENT, SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT
HAVING COUNT(*) >= 2 AND SUM(SALARY) > 90000;
