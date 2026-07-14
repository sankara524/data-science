USE COMPANY_DB;

SELECT * FROM EMPLOYEES1;

-- GROUP BY
-- Find the average salary of employees in each department.
SELECT DEPARTMENT, AVG(SALARY) AVG_SAL FROM EMPLOYEES1
GROUP BY DEPARTMENT;

-- Find the number of employees in each department who are older than 25 years.
SELECT DEPARTMENT, COUNT(*) FROM EMPLOYEES1
WHERE AGE > 25
GROUP BY DEPARTMENT;


-- HAVING CLAUSE
-- Find the departments where the average salary is greater than 55,000.
SELECT DEPARTMENT, AVG(SALARY) AVG_SAL FROM EMPLOYEES1
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 55000;

-- Find the departments that have 1 employee who is older than 25.
SELECT DEPARTMENT, COUNT(*) TOTAL_EMP FROM EMPLOYEES1
WHERE AGE >= 25		-- older than 25
GROUP BY DEPARTMENT
HAVING COUNT(*) = 1;  	-- departments that have 1 employee


-- ORDER BY CLAUSE

-- Clauses
/* Display the Name, Age, and City of all employees from 'Hyderabad'. 
The results should be sorted from oldest to youngest.
Skip the two oldest members and show only the next five members in the list.
Rename the 'name' column as 'Emp Name' in the output. */

SELECT NAME EMP_NAME, AGE, CITY
FROM EMPLOYEES1
WHERE CITY = 'HYDERABAD'
ORDER BY AGE DESC
LIMIT 5 OFFSET 2;    -- (OR)  LIMIT 2,5 


/* List the Name, Age, and City of Employee members who live in 'Mumbai'.
Sort the results by Age in ascending order (youngest first).
Skip the youngest staff and display the next 2 staff members.
Rename the 'Email' column as 'Contact Email' in the output. */

SELECT NAME, AGE, CITY AS LOCATION FROM EMPLOYEES1
WHERE CITY = 'MUMBAI'
ORDER BY AGE
LIMIT 2;