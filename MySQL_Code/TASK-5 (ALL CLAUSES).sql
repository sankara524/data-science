-- TASK-5: ALL CLAUSES

CREATE DATABASE ecommerce_sales_db;

USE ecommerce_sales_db;

-- TASK 1: DATABASE & TABLE DESIGN (DDL + DML)

CREATE TABLE customers (
   customer_id INT PRIMARY KEY,
   customer_name VARCHAR(50) NOT NULL,
   email VARCHAR(100) UNIQUE NOT NULL,
   phone VARCHAR(15) UNIQUE NOT NULL,
   city VARCHAR(50) NOT NULL
);

CREATE TABLE sales_orders (
   order_id INT PRIMARY KEY,
   order_date DATE NOT NULL,
   order_amount DECIMAL(10,2) NOT NULL CHECK (order_amount > 0),
   payment_mode VARCHAR(20) NOT NULL,
   order_status VARCHAR(20) DEFAULT 'Pending',
   customer_id INT NOT NULL,
   FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1, 'Ravi Kumar', 'ravi@gmail.com', '9000000001', 'Bangalore'),
(2, 'Anita Sharma', 'anita@gmail.com', '9000000002', 'Delhi'),
(3, 'Mohit Verma', 'mohit@gmail.com', '9000000003', 'Mumbai'),
(4, 'Priya Singh', 'priya@gmail.com', '9000000004', 'Pune'),
(5, 'Arjun Patel', 'arjun@gmail.com', '9000000005', 'Ahmedabad'),
(6, 'Neha Joshi', 'neha@gmail.com', '9000000006', 'Bangalore'),
(7, 'Amit Das', 'amit@gmail.com', '9000000007', 'Kolkata'),
(8, 'Sneha Roy', 'sneha@gmail.com', '9000000008', 'Delhi'),
(9, 'Rahul Mehta', 'rahul@gmail.com', '9000000009', 'Mumbai'),
(10, 'Kavya Nair', 'kavya@gmail.com', '9000000010', 'Bangalore'),
(11, 'Suresh Iyer', 'suresh@gmail.com', '9000000011', 'Chennai'),
(12, 'Pankaj Gupta', 'pankaj@gmail.com', '9000000012', 'Delhi'),
(13, 'Divya Rao', 'divya@gmail.com', '9000000013', 'Hyderabad'),
(14, 'Manoj Singh', 'manoj@gmail.com', '9000000014', 'Jaipur'),
(15, 'Ritika Malhotra', 'ritika@gmail.com', '9000000015', 'Pune');

select * from customers;

INSERT INTO sales_orders VALUES
(101, '2025-01-01', 2500.00, 'UPI', 'Delivered', 1),
(102, '2025-01-02', 1800.00, 'Credit Card', 'Delivered', 2),
(103, '2025-01-03', 4200.00, 'Debit Card', 'Shipped', 1),
(104, '2025-01-04', 999.00, 'Cash on Delivery', 'Pending', 3),
(105, '2025-01-05', 3500.00, 'UPI', 'Delivered', 5),
(106, '2025-01-06', 4999.00, 'Credit Card', 'Delivered', 1),
(107, '2025-01-07', 799.00, 'UPI', 'Delivered', 2),
(108, '2025-01-08', 1299.00, 'Debit Card', 'Shipped', 3),
(109, '2025-01-09', 5999.00, 'UPI', 'Delivered', 4),
(110, '2025-01-10', 1999.00, 'Cash on Delivery', 'Pending', 5),
(111, '2025-01-11', 7499.00, 'UPI', 'Delivered', 6),
(112, '2025-01-12', 2999.00, 'Credit Card', 'Shipped', 7),
(113, '2025-01-13', 1599.00, 'Debit Card', 'Delivered', 1),
(114, '2025-01-14', 3499.00, 'UPI', 'Delivered', 2),
(115, '2025-01-15', 9999.00, 'Credit Card', 'Delivered', 8),
(116, '2025-01-16', 899.00, 'Cash on Delivery', 'Pending', 4),
(117, '2025-01-17', 2599.00, 'UPI', 'Delivered', 6),
(118, '2025-01-18', 4599.00, 'Debit Card', 'Shipped', 7),
(119, '2025-01-19', 1899.00, 'UPI', 'Delivered', 3),
(120, '2025-01-20', 6999.00, 'Credit Card', 'Delivered', 8),
(121, '2025-01-21', 1499.00, 'UPI', 'Delivered', 9),
(122, '2025-01-22', 3299.00, 'Credit Card', 'Delivered', 10),
(123, '2025-01-23', 799.00, 'Cash on Delivery', 'Pending', 11),
(124, '2025-01-24', 5499.00, 'Debit Card', 'Delivered', 12),
(125, '2025-01-25', 2199.00, 'UPI', 'Delivered', 13),
(126, '2025-01-26', 9999.00, 'Credit Card', 'Delivered', 14),
(127, '2025-01-27', 4599.00, 'Debit Card', 'Shipped', 15),
(128, '2025-01-28', 1899.00, 'UPI', 'Delivered', 9),
(129, '2025-01-29', 2799.00, 'Credit Card', 'Delivered', 10),
(130, '2025-01-30', 899.00, 'Cash on Delivery', 'Pending', 11),
(131, '2025-02-01', 3499.00, 'UPI', 'Delivered', 12),
(132, '2025-02-02', 5999.00, 'Credit Card', 'Delivered', 13),
(133, '2025-02-03', 2499.00, 'Debit Card', 'Shipped', 14),
(134, '2025-02-04', 1299.00, 'UPI', 'Delivered', 15),
(135, '2025-02-05', 4599.00, 'Credit Card', 'Delivered', 9),
(136, '2025-02-06', 7999.00, 'UPI', 'Delivered', 10),
(137, '2025-02-07', 1599.00, 'Cash on Delivery', 'Pending', 11),
(138, '2025-02-08', 3299.00, 'Debit Card', 'Delivered', 12),
(139, '2025-02-09', 2199.00, 'UPI', 'Delivered', 13),
(140, '2025-02-10', 6799.00, 'Credit Card', 'Delivered', 14),
(141, '2025-02-11', 1999.00, 'UPI', 'Delivered', 15),
(142, '2025-02-12', 4899.00, 'Credit Card', 'Delivered', 9),
(143, '2025-02-13', 2599.00, 'Debit Card', 'Shipped', 10),
(144, '2025-02-14', 999.00, 'Cash on Delivery', 'Pending', 11),
(145, '2025-02-15', 7499.00, 'UPI', 'Delivered', 12),
(146, '2025-02-16', 3299.00, 'Credit Card', 'Delivered', 13),
(147, '2025-02-17', 1799.00, 'Debit Card', 'Delivered', 14),
(148, '2025-02-18', 2199.00, 'UPI', 'Delivered', 15),
(149, '2025-02-19', 5699.00, 'Credit Card', 'Delivered', 9),
(150, '2025-02-20', 899.00, 'Cash on Delivery', 'Pending', 10);

select * from sales_orders;

-- TASK 2: Dataset Understanding & Concepts
/* 
Q1. Primary Key Understanding
a) What is a Primary Key?

ANS : primary key helps a row to identify uniquely in a table, a table can have only one primary key and it should not be null as well 

b) Identify Primary Keys from the Dataset
1. What is the primary key of the customers table?
- Table Name: customers 
- Column Name: customer_id 

2. What is the primary key of the sales_orders table?
- Table Name: sales_orders
- Column Name: order_id

c) Why is Primary Key Important in This Dataset?

Explain how the primary key helps in:
- Uniquely identifying records
ANS :-  primary key has strict rule as it should  be a uniques for each row 

- Avoiding duplicate data
ANS :- while the each row has been uniquly identified it's help us to avoid the duplivcate data

- Managing customers and orders in real e-commerce systems
ANS :- Here every customer uniquely identify by primary keu such as possibly(ID, Cus_ID, etc related )


Q2. Foreign Key Understanding :

a) What is a Foreign Key?
 Explain in simple words what a foreign key does.
 ANS :- Foreign key hepls to establish the connection between two table with the common column 
		this column could be a primary key in another table(parent) a normal column(child table)
        ex :-  Table A :(ID,Name,Dep_ID),   Table B (Dept_ID,Dept_Name)
        
b) Identify Foreign Key from the Dataset
ANS:- Foriegn key in the data set is the 'customer_id'
    
- Child Table 
ANS :- Child table is the  sales_orders Table
	
- Foreign Key Column:
ANS :- customer_id

- References Table:
ANS :- Reference table is nothing but parent table ('customers')

- References Column:
ANS :- Reference Column is ('customer_id')

Q3. Constraints Used in the Dataset

Customers Table :-a
{
customer_id = Primary Key (It can be Auto increment)

customer_name = NOT NULL

email = UNIQUE

Phone = UNIQUE + NOT NULL

City = D
}

Sales Orders Table
{
order_id : Primary Key

order_date :  NOT NULL

order_amount: NOT NULL

payment_mode : NOT NULL CHECK(payment_mode > 0)

order_status :  DEFAULT 'Pending'

customer_id : Foriegn Key

}
*/

-- TASK-3: WHERE Clause (Filtering Data)
-- Part A: Comparison Operators : 

-- 1. Show all orders where order_amount > 5000 ? 
select * from sales_orders 
where order_amount > 5000;

-- 2. Display orders where order_amount < 2000
select * from sales_orders 
where order_amount < 2000;

-- 3. Find orders where order_status = 'Delivered'
select * from sales_orders 
where order_status = 'delivered';

-- 4. Get customers where city = 'Bangalore'
select * from customers
where city = 'Bangalore';

-- 5. Show customer whose customer_id = 10
select  * from customers
where customer_id = 10;

-- 6. Find orders where order_amounts >= 3000
select * from sales_orders
where order_amount >= 3000;

-- 7. Display orders where order_amount <= 4000
select * from sales_orders
where  order_amount <= 4000;


-- Part B: Logical Operators
-- 1. Find orders where order_amount > 3000 AND order_status = 'Delivered'
select * from sales_orders
where payment_mode = 'UPI' AND order_amount > 2000;

-- 2. Display customers from Delhi OR Mumbai
select * from customers
where city = 'Delhi' or city = 'Mumbai';

-- 3. Show orders where payment_mode = 'UPI' AND order_amount > 2000
select * from sales_orders
where payment_mode = 'UPI' AND order_amount > 2000;

-- 4. Find orders that are NOT Delivered
select * from sales_orders
where not order_status = 'Delivered';

-- 5. Display customers who are NOT from Bangalore
select * from customers
where not city= 'Bangalore';

-- 6. Find orders where order_status = 'Shipped' OR order_status = 'Delivered'
select * from sales_orders
where order_status = 'Shipped' or order_status = 'Delivered';


-- Part C: BETWEEN
-- 1. Find orders where order_amount BETWEEN 2000 AND 5000
select * from sales_orders
where order_amount between 2000 and 5000;

-- 2. Get customers with customer_id BETWEEN 5 AND 15
select * from customers 
where customer_id between  5 and 15;

-- 3. Show orders with amount between 1000 and 3000
select * from sales_orders
where order_amount between 1000 and 3000;


-- Part D: IN / NOT IN
-- 1. Find orders with payment_mode IN ('UPI', 'Credit Card')
select * from sales_orders
where payment_mode in ('UPI', 'Credit Card');

-- 2. Show customers from cities IN ('Bangalore', 'Hyderabad', 'Chennai')
select * from customers
where city in ('bangalore','hyderabad','chennai');

-- 3. Get orders with status IN ('Delivered', 'Shipped')
select * from sales_orders
where order_status in ('delivered','shipped');


-- TASK 4: GROUP BY and HAVING
-- Part A: GROUP BY
-- 1. Find total sales amount per customer
select c.customer_id, c.customer_name , sum(s.order_amount) as Amount 
from customers as c
inner join sales_orders s
on c.customer_id = s.customer_id
group by  c.customer_id, customer_name;

-- 2. Count total orders per customer
select c.customer_name ,count(c.customer_id) as Orders from customers as c
inner join sales_orders as s
on c.customer_id = s.customer_id
group by c.customer_name;

-- 3. Find total sales per payment mode
select payment_mode , sum(order_amount) as Amount
from sales_orders 
group by payment_mode ;

-- 4. Find total sales per order_status
select order_status , sum(order_amount) as SUM
from sales_orders
group by order_status;

-- 5. Find number of orders per city
select c.city ,count(s.customer_id) from customers as c
inner join sales_orders s
on c.customer_id =s.customer_id
group by c.city
;

-- 6. Find average order value per customer
select c.customer_id , c.customer_name , avg(s.order_amount) from customers as c
inner join sales_orders as  s
on c.customer_id = s.customer_id
group by c.customer_id , c.customer_name;

-- 7. Find minimum and maximum order amount per payment mode
select payment_mode , min(order_amount) as Minimum , max(order_amount) as Maximum from sales_orders
group by payment_mode;


-- Part B: HAVING
-- 1. Show customers whose total sales > 10000
SELECT c.customer_id,
       c.customer_name,
       SUM(s.order_amount) AS total_sales
FROM customers c
INNER JOIN sales_orders s
ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(s.order_amount) > 10000;

-- 2. Find payment modes where total sales > 20000
select payment_mode , sum(order_amount)  as Amount
from sales_orders
group by payment_mode
having sum(order_amount) > 20000;

-- 3. Display customers with more than 3 orders
select c.customer_name , count(c.customer_id) from customers as c
inner join sales_orders as s
on c.customer_id = s.customer_id
group by c.customer_id , c.customer_name 
having count(c.customer_id) > 3;

-- 4. Find cities with more than 5 orders
select c.city , count(s.order_id) as orders from customers as c
inner join sales_orders as s
on c.customer_id = s.customer_id
group by c.city  
having count(s.order_id) > 5;

-- 5. Show order_status having total sales > 15000
select s.order_status , sum(s.order_amount) as orders from customers as c
inner join sales_orders as s
on c.customer_id = s.customer_id
group by s.order_status  
having sum(s.order_amount) > 15000;


-- TASK 5: ORDER BY and LIMIT
-- Part A: ORDER BY
-- 1. Display all orders sorted by order_amount (ascending)
select * from sales_orders
order by order_amount ;

-- 2. Display all orders sorted by order_amount (descending)
select * from sales_orders
order by order_amount desc;

-- 3. Show customers sorted by customer_name
select * from customers
order by customer_name;

-- 4. Sort orders by order_date (latest first)
select * from sales_orders
order by order_date desc;

-- 5. Sort orders by order_status and then order_amount
select * from sales_orders
order by order_status,order_amount;

-- Part B: LIMIT
-- 1. Show top 5 highest value orders
select * from sales_orders
order by order_amount desc
limit 5;

-- 2. Show top 3 customers with highest order_amount
select c.customer_id, c.customer_name, s.order_amount
from customers c
inner join sales_orders s
on c.customer_id = s.customer_id
order by s.order_amount desc
limit 3;

-- 3. Display first 10 orders from sales_orders
select * from sales_orders
limit 10;

-- 4. Show bottom 5 lowest value orders
select * from sales_orders
order by order_amount asc
limit 5;

-- 5. Show latest 5 orders
select * from sales_orders
order by order_date desc
limit 5;
