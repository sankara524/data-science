-- TASK-8: Advance Queries (SQL)

CREATE DATABASE IF NOT EXISTS ECommerceDB;

USE ECommerceDB;

-- 1. Products Table
CREATE TABLE Products (
    ProdID INT AUTO_INCREMENT PRIMARY KEY,
    ProdName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

-- 2. Customers Table
CREATE TABLE Customers (
    CustID INT AUTO_INCREMENT PRIMARY KEY,
    CustName VARCHAR(100),
    City VARCHAR(50),
    JoinDate DATE
);

-- 3. Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustID INT,
    ProdID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustID) REFERENCES Customers(CustID),
    FOREIGN KEY (ProdID) REFERENCES Products(ProdID)
);

-- INSERTING DATA
INSERT INTO Products (ProdName, Category, Price, Stock) VALUES
('iPhone 15', 'Electronics', 800.00, 10),
('MacBook Air', 'Electronics', 1200.00, 5),
('Desk Lamp', 'Home Decor', 25.00, 20),
('Gaming Chair', 'Furniture', 250.00, 0), -- For Out of Stock View
('USB Cable', 'Electronics', 15.00, 50);

SELECT * FROM PRODUCTS;

INSERT INTO Customers (CustName, City, JoinDate) VALUES
('Vineela', 'Hyderabad', '2023-01-01'),
('Arjun', 'Bangalore', '2023-05-10'),
('Sai', 'Hyderabad', '2024-01-15'),
('Ananya', 'Mumbai', '2024-02-20'),
('Rahul', 'Delhi', '2024-03-01');

SELECT * FROM CUSTOMERS;

INSERT INTO Orders (CustID, ProdID, OrderDate, Quantity) VALUES
(1, 2, '2023-12-01', 1), -- Revenue 1200 (For Q10)
(2, 1, '2024-01-05', 1), -- Year 2024 (For Q9)
(3, 3, '2024-02-10', 2), -- Year 2024 (For Q9)
(1, 5, '2024-02-15', 10), -- Revenue 150
(4, 2, '2024-02-20', 1); -- Year 2024

SELECT * FROM ORDERS;

-- 1. Subqueries
-- 1. Find the names of products that are priced higher than the average price of all products.
SELECT PRODNAME, PRICE
FROM PRODUCTS
WHERE PRICE > (SELECT AVG(PRICE) 
				FROM PRODUCTS);


-- 2. List the names of customers who have never placed an order using a subquery with a NOT NULL check.
SELECT CUSTNAME
FROM CUSTOMERS
WHERE CUSTID NOT IN (SELECT CUSTID
						FROM ORDERS
                        WHERE CUSTID IS NOT NULL);


-- 3. Find the name of the customer who placed the very first order by joining the customer table with a subquery that finds the minimum order date.
SELECT C.CUSTNAME
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTID = O.CUSTID
WHERE O.ORDERDATE = (SELECT MIN(ORDERDATE)
						FROM ORDERS);


-- 2. Derived Tables
-- 4. Select the product names and prices from a derived table that filters the main products table for only the 'Electronics' category.
SELECT PRODNAME, PRICE
FROM (SELECT * 
		FROM PRODUCTS
        WHERE CATEGORY = 'ELECTRONICS'
        ) AS ELECTRONIC_PRODUCTS;


-- 5. Show customer names and their total order counts by joining the customers table with a derived table that groups orders by customer ID.
SELECT C.CUSTNAME, T.TOTALORDERS
FROM CUSTOMERS C
JOIN (SELECT CUSTID, COUNT(*) AS TOTALORDERS
		FROM ORDERS
        GROUP BY CUSTID
        ) T ON C.CUSTID = T.CUSTID;


-- 6. Find the highest priced product in the database using a simplified derived table using a ranking function.
SELECT PRODNAME, PRICE
FROM (SELECT *,
		RANK() OVER (ORDER BY PRICE DESC) AS RNK
        FROM PRODUCTS
        ) T WHERE RNK = 1;


-- 3. Views
-- 7. Create a view called OutofStock that displays the names and categories of products with zero stock, and write a query to access all records from it.
CREATE VIEW OUTOFSTOCK AS
SELECT PRODNAME, CATEGORY
FROM PRODUCTS
WHERE STOCK = 0;

SELECT * FROM OUTOFSTOCK;


-- 8. Create a view called RecentOrders that lists orders placed in the last 30 days using the DATEDIFF function, and write a query to access it.
CREATE VIEW RECENTORDERS AS
SELECT * 
FROM ORDERS
WHERE DATEDIFF(CURDATE(), ORDERDATE) <= 30;

SELECT * FROM RECENTORDERS;


-- 9. Create a view called CustomerOrderSummary that joins Customers and Orders to show CustName, OrderID, and OrderDate. Write a query to access this view that prints only the CustName and OrderDate for orders placed in the year 2024.
CREATE VIEW CUSTOMER_ORDER_SUMMARY AS
SELECT C.CUSTNAME, O.ORDERID, O.ORDERDATE
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTID = O.CUSTID;

-- Orders placed in 2024
SELECT CUSTNAME, ORDERID
FROM CUSTOMER_ORDER_SUMMARY
WHERE YEAR(ORDERDATE) = 2024;


-- 4. Common Table Expressions (CTE)
-- 10. Use a CTE to calculate the revenue (Price * Quantity) for each order, then select the OrderID for all orders where the revenue is over 500.
WITH REVENUE_CTE AS
(
SELECT 
	O.ORDERID, (P.PRICE * O.QUANTITY) AS REVENUE
FROM ORDERS O
JOIN PRODUCTS P
ON O.PRODID = P.PRODID
)

SELECT * 
FROM REVENUE_CTE
WHERE REVENUE > 500;


-- 11. Create a CTE to list unique cities from the customers table, then use it to count how many customers live in each of those cities.
WITH CITY_CTE AS
(
SELECT DISTINCT CITY
FROM CUSTOMERS
)

SELECT C.CITY, COUNT(CU.CUSTID) AS TOTAL_CUSTOMERS
FROM CITY_CTE C
JOIN CUSTOMERS CU
ON C.CITY = CU.CITY
GROUP BY C.CITY;


-- 12. Use a CTE to identify the top 2 most expensive products in the system and check if those specific products have ever been ordered.
WITH TOP_PRODUCTS AS
(
SELECT PRODID, PRODNAME, PRICE, DENSE_RANK() OVER (ORDER BY PRICE DESC) AS RNK
FROM PRODUCTS
)

SELECT T.PRODNAME, T.PRICE, O.ORDERID
FROM TOP_PRODUCTS T
LEFT JOIN ORDERS O
ON T.PRODID = O.PRODID
WHERE T.RNK <= 2;


-- 5. Stored Procedures
-- 13. Create a stored procedure named GetCustomerByCity that takes a city name as an input parameter and returns all customer details for that city.

DELIMITER $$
CREATE PROCEDURE GetCustomerByCity(IN P_CITY VARCHAR(50)) 
BEGIN 
	SELECT * 
    FROM CUSTOMERS 
    WHERE CITY = P_CITY; 
END $$ 
DELIMITER ;

CALL GetCustomerByCity('HYDERABAD');


-- 14. Create a stored procedure named ApplyDiscount that takes a category name and a discount percentage as inputs to update the prices of all products in that category.
DELIMITER $$
CREATE PROCEDURE ApplyDiscount
					(IN P_CATEGORY VARCHAR(50),
                     IN P_DISCOUNT DECIMAL(5,2))
BEGIN
	UPDATE PRODUCTS
    SET PRICE = PRICE - (PRICE * P_DISCOUNT / 100)
    WHERE CATEGORY = P_CATEGORY;
END $$
DELIMITER ;

CALL ApplyDiscount('ELECTRONICS', 10);


-- 15. Create a stored procedure named CheckStock that takes a single ProdID as an input and returns the stock status ('In Stock' or 'Sold Out') using a CASE statement.
DELIMITER $$
CREATE PROCEDURE CheckStock(IN P_PRODID INT)
BEGIN
	SELECT PRODID, PRODNAME, STOCK, 
		CASE 
			WHEN STOCK > 0 THEN 'IN STOCK'
			ELSE 'SOLD OUT'
		END AS STOCK_STATUS
    FROM PRODUCTS
    WHERE PRODID = P_PRODID;
END $$ 
DELIMITER ;

CALL CheckStock(4);


-- 6. Triggers
-- 16. Create an AFTER INSERT trigger on the orders table that automatically reduces the Stock quantity in the products table whenever a new order is placed.
DELIMITER $$
CREATE TRIGGER CheckStock
AFTER INSERT ON ORDERS
FOR EACH ROW
BEGIN
	UPDATE PRODUCTS
    SET STOCK = STOCK - NEW.QUANTITY
    WHERE PRODID = NEW.PRODID;
END $$
DELIMITER ;


-- 17. Create a BEFORE DELETE trigger on the customers table that prevents a customer from being deleted if they have one or more orders, by raising a custom error message.
DELIMITER $$
CREATE TRIGGER trg_PreventCustomerDelete
BEFORE DELETE ON CUSTOMERS
FOR EACH ROW
BEGIN
	DECLARE TOTAL_ORDERS INT;
    SELECT COUNT(*) INTO TOTAL_ORDERS
    FROM ORDERS
    WHERE CUSTID = OLD.CUSTID;
    
    IF TOTAL_ORDERS > 0 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'CANNOT DELETE CUSTOMER BECAUSE ORDERS EXIST.';
	END IF;
END $$
DELIMITER ;


-- 18. Create a BEFORE UPDATE trigger on the products table that ensures a product's price is automatically set to 1 if an update attempt tries to set the price to a value less than 1.
DELIMITER $$
CREATE TRIGGER trg_CheckPrice
BEFORE UPDATE ON PRODUCTS
FOR EACH ROW
BEGIN
	IF NEW.PRICE < 1 THEN 
		SET NEW.PRICE = 1;
	END IF;
END $$
DELIMITER ;
