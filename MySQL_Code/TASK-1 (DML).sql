-- TASK-1:  SQL - DML

CREATE DATABASE college_db;

USE college_db;

CREATE TABLE students (
    ID INT PRIMARY KEY,
    FNAME VARCHAR(30),
    LNAME VARCHAR(30),
    Gender CHAR(1),
    DOB DATE,
    Enrollment_Date DATE,
    Fee_Paid DECIMAL(10,2)
);

INSERT INTO students VALUES 
(101, 'Rahul', 'Kumar', 'M', '2005-05-15', '2023-01-10', 5000.00),
(102, 'Priya', 'Sharma', 'F', '2004-01-20', '2022-12-15', 12000.00),
(103, 'Arjun', 'Singh', 'M', '2005-11-30', '2023-02-01', 0.00),
(104, 'Sneha', 'Patel', 'F', '2003-01-05', '2021-06-20', 15000.00),
(105, 'Kiran', 'Seth', 'O', '2005-08-12', '2023-01-25', 4500.00),
(106, 'Amit', 'Verma', 'M', '2002-12-10', '2019-05-10', 8000.00),
(107, 'Kiran', 'Gupta', 'M', '2004-03-15', '2022-08-14', 9500.00),
(108, 'Anjali', 'Reddy', 'F', '2005-01-25', '2023-03-10', 2000.00),
(109, 'Rohan', 'Das', 'M', '2004-07-04', '2022-11-30', 11000.00),
(110, 'Sanya', 'Iyer', 'F', '2005-09-18', '2023-02-15', 0.00);

SELECT * FROM students;


-- TASK:

-- Part A: DML 
-- 1. The Scholarship: Update the Fee_Paid for 'Arjun Singh' (ID 103). He just paid 4000.00.
UPDATE STUDENTS
SET FEE_PAID = 4000
WHERE FNAME = 'ARJUN';

SELECT * FROM STUDENTS;

-- 2. The Correction: You realized 'Kiran Seth' (ID 105) is actually Female. Update the gender accordingly.
UPDATE STUDENTS
SET GENDER = 'F'
WHERE ID = 105;

SELECT * FROM STUDENTS;

-- 3. The "S" Family Discount: The college is giving a 500.00 bonus to all students
-- whose Last Name starts with the letter 'S'. Increase their Fee_Paid by 500.
UPDATE STUDENTS
SET FEE_PAID = FEE_PAID + 500
WHERE LNAME LIKE 'S%';

SELECT * FROM STUDENTS;

-- 4. The Name Change: 'Sneha Patel' got married and changed her last name to 'Shah'. Update her record.
UPDATE STUDENTS
SET LNAME = 'SHAH'
WHERE ID = 104;

SELECT * FROM STUDENTS;

-- 5. The Defaulter List: Delete all students who have Fee_Paid as 0.00.
DELETE FROM STUDENTS
WHERE FEE_PAID = 0;

SELECT * FROM STUDENTS;

-- 6. The Pattern Search: Find all students whose First Name has exactly 5 characters and 
-- ends with the letter 'a'. Display their FNAME and LNAME.
SELECT FNAME, LNAME
FROM STUDENTS
WHERE FNAME LIKE '_____a';


-- 7. The High-Fee Cleanup: Delete the records of any student who has paid more than 14,000 in fees.
DELETE FROM STUDENTS
WHERE FEE_PAID > 14000;

SELECT * FROM STUDENTS;

-- 8. The Bulk Discount: Give a 10% discount to everyone who has paid more than 10,000.
-- (Update Fee_Paid to be 90% of its current value).
UPDATE STUDENTS
SET FEE_PAID = FEE_PAID * 0.90
WHERE FEE_PAID > 10000;

SELECT * FROM STUDENTS;

-- 9. The Identity Crisis: There are two students named 'Kiran'. Write a query to display only the 'Kiran' who is Male.
SELECT *
FROM STUDENTS
WHERE FNAME = 'KIRAN' AND GENDER = 'M';

-- 10. The Audit: Display the FNAME and LNAME of all students, but rename the columns in the output to First_Name and Last_Name.
SELECT 
FNAME AS FIRST_NAME,
LNAME AS LAST_NAME
FROM STUDENTS;
