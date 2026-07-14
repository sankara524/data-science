-- TASK-3:  WHERE CLAUSE, OPERTORS

-- CREATE DATABASE LIBRARY_DB;

USE LIBRARY_DB;

CREATE TABLE Books
(
ID INT PRIMARY KEY,
Title VARCHAR(100),
Author VARCHAR(100),
Genre VARCHAR(50),
PublicationYear INT,
Price DECIMAL(10, 2)
);

INSERT INTO Books (ID, Title, Author, Genre, PublicationYear, Price) VALUES
(1, 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 'Fantasy', 1997, 550.00),
(2, 'The Alchemist', 'Paulo Coelho', 'Fiction', 1988, 400.00),
(3, 'The Hound of the Baskervilles', 'Arthur Conan Doyle', 'Mystery', 1902, 350.00),
(4, 'Wings of Fire', 'A.P.J. Abdul Kalam', 'Biography', 1999, 450.00);

SELECT * FROM BOOKS;

-- AS KEYWORD
SELECT ID, TITLE, PRICE, PRICE+10 AS INCREASED_PRICE
FROM BOOKS;

-- QUESTIONS:

-- 1. ARITHMATIC OPERATORS
-- Increase the price of the book 'The Alchemist' by 5/-.
UPDATE BOOKS
SET PRICE = PRICE+5
WHERE TITLE = 'The Alchemist'; 

SELECT * FROM BOOKS;


-- Decrease the price of all books by 3/-.
UPDATE BOOKS
SET PRICE = PRICE-3;

SELECT * FROM BOOKS;


-- Display the title and a new column showing the "Double Price" for every book.
SELECT TITLE, PRICE * 2 AS DOUBLE_PRICE
FROM BOOKS;


-- Show the price after a 50% discount for all books.
SELECT TITLE, PRICE, PRICE * 0.50 AS DISCOUNT_PRICE
FROM BOOKS;


-- For all records with an even ID number (ID % 2), add 10/- to their price.
UPDATE BOOKS
SET PRICE = PRICE + 10
WHERE ID % 2 = 0;

SELECT * FROM BOOKS;


-- 2. COMPARISION OPERATORS
-- Display all records where the price is greater than 600.
SELECT * 
FROM BOOKS
WHERE PRICE > 600;


-- Find all books published before the year 1990.
SELECT * 
FROM BOOKS
WHERE PUBLICATIONYEAR < 1990;


-- Retrieve details for books where the author's name is 'J.K. Rowling'.
SELECT * 
FROM BOOKS
WHERE AUTHOR = "J.K. Rowling";


-- Display all books belonging to any genre except 'FICTION'.
SELECT * 
FROM BOOKS
WHERE GENRE != 'FICTION';


-- 3. LOGICAL OPERATORS
-- Find books published in 1997 AND having a price less than 900.
SELECT *
FROM BOOKS
WHERE PUBLICATIONYEAR = 1997 AND PRICE < 900;


-- Retrieve records with the Genre 'Fiction' and 'Mystery'.
SELECT *
FROM BOOKS
WHERE GENRE IN('FICTION', 'MYSTERY');


-- 4. SPECIAL OPERATORS
-- Display books where the price is in the range of 400 and 500.
SELECT * FROM BOOKS
WHERE PRICE BETWEEN 400 AND 500;


-- Display records where the Genre is specifically 'Fiction' or 'Mystery'.
SELECT * FROM BOOKS
WHERE GENRE IN ('FICTION', 'MYSTERY');


-- Display all records where the Title has a non-null value.
SELECT * FROM BOOKS
WHERE TITLE IS NOT NULL; 


-- Find all authors whose name starts with "A".
SELECT AUTHOR FROM BOOKS    -- PRINT ALL AUTHORS SO WE DONT PUT * (STAR)
WHERE AUTHOR LIKE 'A%';


-- Find all titles that are exactly 13 characters long and end with "e".
SELECT TITLE FROM BOOKS
WHERE TITLE LIKE '____________E';

-- OR  (Another Method to Check length Characaters).
SELECT TITLE FROM BOOKS
WHERE CHAR_LENGTH(TITLE) = 13 AND TITLE LIKE '%E';