-- TASK-7: Window Functions

USE company_2;

SELECT * FROM departments2;

SELECT * FROM employees2;

-- 1: The Unique Serial
-- Write a query to assign a unique sequential row number to every employee based on their SALARY from highest to lowest. Even if two employees have the same salary, they must have different row numbers.
SELECT 
	ID,
    NAME,
    DEPARTMENT,
    SALARY,
    ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS ROW_NO
FROM EMPLOYEES2;
	

-- 2: The Department Podium (with Gaps)
-- Rank employees within each DEPARTMENT based on their SALARY (highest to lowest). If two people tie for 1st place, the next rank should skip to 3rd.
SELECT 
	ID, 
    NAME, 
    DEPARTMENT, 
    SALARY, 
    RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS DEPT_RANK 
    FROM EMPLOYEES2;

-- 3: The No-Gap Rank
-- Rank employees within each DEPARTMENT based on their SALARY (highest to lowest), but ensure that no rank numbers are skipped after a tie (e.g., if two people tie for 1st, the next person is 2nd).
SELECT 
	ID, 
    NAME, 
    DEPARTMENT, 
    SALARY, 
    DENSE_RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS DENSE_R
    FROM employees2;

-- 4: The Next Person
-- For each employee, show their current SALARY and the SALARY of the next person who joined in the same DEPARTMENT (ordered by DATE_OF_JOINING).
SELECT 
	NAME,
    DEPARTMENT,
    DATE_OF_JOINING,
    SALARY,
    LEAD(SALARY) OVER
		(PARTITION BY DEPARTMENT 
        ORDER BY 
        DATE_OF_JOINING) AS NEXT_PERSON_SALARY
FROM EMPLOYEES2;

-- 5: The Percentile
-- Calculate the PERCENT_RANK() for each employee based on their SALARY across the whole company. If an employee gets a result of 0.0, does that mean they have the highest or lowest salary?
SELECT
	NAME,
    SALARY,
    PERCENT_RANK() OVER (ORDER BY SALARY) AS PERCENTILE
FROM EMPLOYEES2;

-- EXPLANATION:
-- If Percent_Rank = 0.0, it means the employee has the LOWEST salary.

-- 6: The Previous Person
-- For each employee, show their current SALARY and the SALARY of the person who joined immediately before them under the same MANAGER_ID (ordered by DATE_OF_JOINING).
SELECT 
	NAME,
    MANAGER_ID,
    DATE_OF_JOINING,
    SALARY,
    LAG(SALARY) OVER
		(PARTITION BY MANAGER_ID 
        ORDER BY DATE_OF_JOINING) AS PREVIOUS_PERSON_SALARY
FROM EMPLOYEES2;

-- 7: The Salary Buckets
-- Divide employees into 4 equal groups (tiles) within each DEPARTMENT based on SALARY from highest to lowest. Add a column dept_salary_tile showing the tile number (1..4) for each employee inside their department.
SELECT
	NAME,
    DEPARTMENT,
    SALARY,
    NTILE(4) OVER
		(PARTITION BY DEPARTMENT
        ORDER BY SALARY DESC) AS DEPT_SALARY_TILE
FROM EMPLOYEES2;

-- 8: The First Hire
-- Write a query to show each employee's NAME, DEPARTMENT, and SALARY. Add a column called max_dept_salary that shows the highest salary in that employee's department.
SELECT 
	NAME,
    DEPARTMENT,
    SALARY,
    MAX(SALARY) OVER (PARTITION BY DEPARTMENT) AS MAX_DEPT_SALARY
FROM EMPLOYEES2;
    
-- 9: The Peer Distribution
-- Calculate the CUME_DIST() for employees within each department ordered by SALARY. If two employees in the same department have the exact same salary, will their distribution value be the same or different?
SELECT 
	NAME,
    DEPARTMENT,
    SALARY,
    CUME_DIST() OVER 
		(PARTITION BY DEPARTMENT 
		ORDER BY SALARY) AS DISTRIBUTION
FROM EMPLOYEES2;

-- EXPLANATION: Yes, Employees with the same salary receive the SAME CUME_DIST() value.

-- 10: The Last Hire
-- Write a query to show each employee's NAME, DEPARTMENT, and SALARY, and add a column that shows the Total Salary of their entire department.
SELECT 
	NAME,
    DEPARTMENT,
    SALARY,
    SUM(SALARY) OVER (PARTITION BY DEPARTMENT) AS TOTAL_DEPARTMENT_SALARY
FROM EMPLOYEES2;

        