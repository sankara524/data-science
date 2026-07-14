USE COMPANY_DB;

CREATE TABLE EMPLOYEES1 (
    ID         INT,
    NAME       VARCHAR(30),
    AGE        INT,
    DOJ        DATE,
    CITY       VARCHAR(30),
    SALARY     DECIMAL(10,2),
    DEPARTMENT VARCHAR(30)
);

SELECT * FROM EMPLOYEES1;

INSERT INTO EMPLOYEES1 (ID, NAME, AGE, DOJ, CITY, SALARY, DEPARTMENT) VALUES
(1, 'Dheeraj', 31, '2024-09-21', 'Hyderabad', 80000.00, 'Finance'),
(2, 'Priya',   25, '2021-03-10', 'Bangalore', 55000.00, 'HR'),
(3, 'Amit',    32, '2018-11-01', 'Mumbai',    75000.00, 'IT'),
(4, 'Sneha',   27, '2022-07-20', 'Chennai',   50000.00, 'Finance'),
(5, 'Varsha',  30, NULL, 'Hyderabad', 70000.00, 'IT');

SELECT * FROM EMPLOYEES1;


-- AGGREGATE FUNCTIONS
-- How many employees are there in the company?
SELECT COUNT(*) AS TOTAL_EMP_COUNT FROM EMPLOYEES1;

-- How many employees are there in the company who belong to Finance and IT?
SELECT COUNT(*) FROM EMPLOYEES1
WHERE DEPARTMENT IN ('FINANCE', 'IT');

-- What is the total salary expense of the company?
SELECT SUM(SALARY) FROM EMPLOYEES1;

-- What is the total salary paid to employees in the FINANCE department?
SELECT SUM(SALARY) FROM EMPLOYEES1
WHERE DEPARTMENT = 'FINANCE';

-- What is the average age of all employees?
SELECT AVG(AGE) FROM EMPLOYEES1;

-- What is the average salary of employees in the IT department?
SELECT AVG(SALARY) FROM EMPLOYEES1
WHERE DEPARTMENT = 'IT';

-- What is the minimum and maximum salary in the company?
SELECT MIN(SALARY), MAX(SALARY) FROM EMPLOYEES1;

-- OR (Both are Working)
SELECT MIN(SALARY) MIN_SAL, MAX(SALARY) MAX_SAL FROM EMPLOYEES1;

-- Who is the youngest employee in the HR department?
SELECT MIN(AGE) FROM EMPLOYEES1
WHERE DEPARTMENT = 'HR';

