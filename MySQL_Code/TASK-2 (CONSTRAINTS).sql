--  TASK-2:  SQL - Constraints 

CREATE DATABASE University_DB;

USE University_DB;

CREATE TABLE Students (
    StudentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Age INT,
    City VARCHAR(50),
    CourseID INT
);

SELECT * FROM STUDENTS;

-- PART A - CONSTRAINTS
-- 1.Modify the StudentID column to be the Primary Key and ensure it increments automatically.
ALTER TABLE STUDENTS
MODIFY STUDENTID INT AUTO_INCREMENT PRIMARY KEY;

DESC STUDENTS;

-- 2. Ensure that the FirstName column can never be empty (NOT NULL).
ALTER TABLE STUDENTS
MODIFY FIRSTNAME VARCHAR(50) NOT NULL;

DESC STUDENTS;

-- 3. Add a constraint to make the Email column Unique so no two students have the same email.
ALTER TABLE STUDENTS
ADD CONSTRAINT UNIQ_EMAIL UNIQUE(EMAIL);

DESC STUDENTS;

-- 4. Add a Check Constraint to the Age column to ensure no student under the age of 17 can be enrolled.
ALTER TABLE STUDENTS
ADD CONSTRAINT CHK_AGE CHECK (AGE > 17);

DESC STUDENTS;

-- 5. Set the Default value of the City column to 'Unknown'.
ALTER TABLE STUDENTS
ALTER CITY SET DEFAULT 'Unknown';

DESC STUDENTS;

-- 6. Create a separate table Courses with CourseID as Primary Key, then add a Foreign Key constraint
-- to the Students table linking CourseID to the Courses table.
CREATE TABLE COURSES(
COURSEID INT PRIMARY KEY,
COURSENAME VARCHAR(100)
);

ALTER TABLE STUDENTS
ADD CONSTRAINT FK_COURSE
FOREIGN KEY (COURSEID)
REFERENCES COURSES (COURSEID);

DESC COURSES;

DESC STUDENTS;


-- 7. Try to insert a student with an age of 15. Write down the error message you receive and explain why it failed.
INSERT INTO Students (StudentID, FirstName, LastName, Email, Age, City, CourseID) VALUES 
(1, 'Rahul', 'Kumar', 'rahul@gmail.com', 15, 'Delhi', 101); 

-- Expected Error: 
-- ERROR: Check constraint 'chk_age' is violated.

-- Explanation: 
-- The 'CHECK' constraint Age >= 17, 
-- so a student age 15 is cannot be inserted.


-- 8. Drop the Unique constraint from the Email column.
ALTER TABLE STUDENTS
DROP INDEX UNIQ_EMAIL;

DESC STUDENTS;

-- 9. Remove the Primary Key from the Students table (Note: You may need to remove Auto_Increment first).
ALTER TABLE STUDENTS
MODIFY STUDENTID INT;

ALTER TABLE STUDENTS
DROP PRIMARY KEY;

DESC STUDENTS;

-- 10. Change the LastName column to allow NULL values.
ALTER TABLE STUDENTS
MODIFY LastName VARCHAR(50) NULL;

DESC STUDENTS;