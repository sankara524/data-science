CREATE DATABASE LIBRARY_DB;

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


-- Decrease the price of all books by 3/-.


-- Display the title and a new column showing the "Double Price" for every book.


-- Show the price after a 50% discount for all books.

-- For all records with an even ID number (ID % 2), add 10/- to their price.


-- COMPATISION OPERATORS
-- Display all records where the price is greater than 600.


-- Find all books published before the year 1990.


-- Retrieve details for books where the author's name is 'J.K. Rowling'.


-- Display all books belonging to any genre except 'FICTION'.


-- LOGICAL OPERATORS
-- Find books published in 1997 AND having a price less than 900.

-- Retrieve records with the Genre 'Fiction' and 'Mystery'.


-- SPECIAL OPERATORS
-- Display books where the price is in the range of 700 and 1500.


-- Display records where the Genre is specifically 'Fiction' or 'Mystery'.


-- Display all records where the Title has a non-null value.


-- Find all authors whose name starts with "A".


-- Find all titles that are exactly 13 characters long and end with "e".