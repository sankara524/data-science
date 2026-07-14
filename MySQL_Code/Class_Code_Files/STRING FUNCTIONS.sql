USE COMPANY_DB;

SELECT * FROM EMPLOYEES1;


-- STRING FUNCTIONS:
-- Show all employee names in uppercase along with their department.
SELECT UPPER(NAME) UPPER_NAME, DEPARTMENT 
FROM EMPLOYEES1;

-- Combine the employee name and department into a single column, separated by a dash ( - ).
SELECT CONCAT(NAME, ' - ', DEPARTMENT) NAME_DEPT
FROM EMPLOYEES1

-- OR
SELECT CONCAT_WS(" - ", NAME, DEPARTMENT) NAME_DEPT
FROM EMPLOYEES1;

-- Display each employee's name and the total number of characters.
SELECT NAME, CHAR_LENGTH(NAME) NO_OF_CHAR
FROM EMPLOYEES1;

-- Extract and display only the first 3 letters of every employee's name.
SELECT NAME, LEFT(NAME, 3) FIRST_3
FROM EMPLOYEES1;

-- (OR)BY USING SUBSTRING 
SELECT NAME, SUBSTR(NAME, 1, 3) FIRST_3
FROM EMPLOYEES1;

-- Display the department names, but replace the word 'IT' with 'TECH'.
SELECT DEPARTMENT, REPLACE(DEPARTMENT, 'IT', 'TECH') IT_TECH
FROM EMPLOYEES1;

-- Find and display the position of the letter 'A' within each employee's name.
SELECT NAME, INSTR(NAME, 'A') A_POSITION
FROM EMPLOYEES1;

-- Display the employee names ensuring that any accidental leading or trailing spaces are removed.
SELECT NAME, TRIM(NAME) NAME_TRIM
FROM EMPLOYEES1;

-- Display each employee’s name in reverse order.
SELECT NAME, REVERSE(NAME) REV_NAME
FROM EMPLOYEES1;

-- Extract and display the last 3 characters of every employee’s name.
SELECT NAME, RIGHT(NAME, 3) LAST_3
FROM EMPLOYEES1;


-- SUBSTRING INDEX
SELECT UPPER('python') C1;

SELECT SUBSTRING_INDEX('123@456@789', '@', 1) SUB_STR_IDX;
SELECT SUBSTRING_INDEX('123@456@789', '@', 2) SUB_STR_IDX;
SELECT SUBSTRING_INDEX('123@456@789', '@', 3) SUB_STR_IDX;
