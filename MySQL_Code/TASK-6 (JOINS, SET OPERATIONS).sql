-- TASK-6: JOINS, Set Operations

-- Create database and use it

CREATE DATABASE IF NOT EXISTS company_2;

USE company_2;

-- Create departments table

CREATE TABLE departments2 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Insert rows in departments

INSERT INTO departments2 (dept_id, dept_name) VALUES
(10, 'IT'),
(20, 'Finance'),
(30, 'HR');

-- Create employees table

CREATE TABLE employees2 (
    ID INT PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    AGE INT,
    DATE_OF_JOINING DATE,
    SALARY DECIMAL(12,2),
    DEPARTMENT VARCHAR(50),
    MANAGER_ID INT NULL
);

-- Insert rows in employees with manager_id

INSERT INTO employees2 (ID, NAME, AGE, DATE_OF_JOINING, SALARY, DEPARTMENT, manager_id) VALUES
(1, 'Priya', 28, '2024-08-11', 50000.00, 'IT', 3),
(2, 'Varsha', 27, '2025-06-15', 60000.00, 'Finance', 3),
(3, 'Sneha', 35, '2020-01-10', 90000.00, 'HR', NULL),
(4, 'Vineela', 30, '2023-03-20', 55000.00, 'IT', 3),
(5, 'Raj', 26, '2024-04-05', 48000.00, 'Finance', 2);

-- Verify inserted data

SELECT * FROM departments2;

SELECT * FROM employees2;


-- Part 1: Joins 
-- 1. The Missing Link: Show the NAME of each employee and their dept_name. If an employee's department is not in the departments table, they should not appear in the list.
SELECT E.NAME, D.DEPT_NAME 
FROM EMPLOYEES2 E 
INNER JOIN DEPARTMENTS2 D 
ON E.DEPARTMENT = D.DEPT_NAME;

-- 2. The "Vineela" Case: List every employee's NAME and their dept_name. Ensure that employees with no department (like Vineela) still appear in your results.
SELECT E.NAME, D.DEPT_NAME 
FROM EMPLOYEES2 E 
LEFT JOIN DEPARTMENTS2 D 
ON E.DEPARTMENT = D.DEPT_NAME;

-- 3. The Ghost Department: List all dept_names. If a department has no employees (like Finance), show the department name with a NULL for the employee name.
SELECT D.DEPT_NAME, E.NAME 
FROM DEPARTMENTS2 D 
LEFT JOIN EMPLOYEES2 E 
ON D.DEPT_NAME = E.DEPARTMENT;

-- 4. The Boss's Boss: Show each employee's NAME and their manager's NAME. Trick: If you use an INNER JOIN, will the CEO (Sneha) appear in the list? Why or why not?
SELECT E.NAME AS EMPLOYEE_NAME, M.NAME AS MANAGER_NAME 
FROM EMPLOYEES2 E 
LEFT JOIN EMPLOYEES2 M 
ON E.MANAGER_ID = M.ID;

-- EXPLANATION: If INNER JOIN is used Sneha will not appear because her MANAGER_ID is NULL.

-- 5. The Department Audit: Find any employee whose DEPARTMENT name in the employees table does not match any dept_name in the departments table. (Hint: Use a LEFT JOIN and look for NULL).
SELECT E.* 
FROM EMPLOYEES2 E 
LEFT JOIN DEPARTMENTS2 D 
ON E.DEPARTMENT = D.DEPT_NAME 
WHERE D.DEPT_NAME IS NULL;

-- Part 2: Set Operations (Vertical Logic)
-- 6. The ID Conflict: Combine all employee IDs and all dept_ids into one column. Trick: Use the operator that ensures you see every single number, even if an ID and a Dept_ID are the same.
SELECT ID 
FROM EMPLOYEES2 
UNION ALL 
SELECT DEPT_ID 
FROM DEPARTMENTS2;

-- 7. The Overlap: Find only the ID numbers that are being used as both an Employee ID and a Department ID.
SELECT ID 
FROM EMPLOYEES2 
WHERE ID IN (SELECT DEPT_ID FROM DEPARTMENTS2);

-- 8. The "Pure" Employees: List all employee IDs that are not also listed as a dept_id.
SELECT ID 
FROM EMPLOYEES2 
WHERE ID NOT IN (SELECT DEPT_ID FROM DEPARTMENTS2);

-- 9. The Alphabetical Mix: Create one list of all employee NAMEs and all dept_names. Sort the final list alphabetically.
SELECT NAME AS LIST 
FROM EMPLOYEES2 
UNION 
SELECT DEPT_NAME 
FROM DEPARTMENTS2 ORDER BY LIST;

-- 10. The Manager Check: List all IDs from the employees table, then remove any ID that is currently acting as a manager_id. (This finds employees who don't manage anyone).
SELECT ID 
FROM EMPLOYEES2 
WHERE ID NOT IN (SELECT MANAGER_ID 
					FROM EMPLOYEES2 
                    WHERE MANAGER_ID IS NOT NULL);