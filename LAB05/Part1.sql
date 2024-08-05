CREATE TABLE ORDERS (
    ord_no INT,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO ORDERS (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760.0, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001),
(70001, 150.5, '2012-10-05', 3005, 5002),  -- Duplicate
(70009, 270.65, '2012-09-10', 3001, 5005), -- Duplicate
(70002, 65.26, '2012-10-05', 3002, 5001);  -- Duplicate

CREATE TABLE SALESMAN (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4, 2)
);

INSERT INTO SALESMAN (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

CREATE TABLE CUSTOMER (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    Grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES SALESMAN(salesman_id)
);

INSERT INTO CUSTOMER (customer_id, cust_name, city, Grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);  -- Assuming NULL for missing Grade

--1. Calculate the Total Purchase Amount of All Orders

SELECT SUM(purch_amt) AS total_purchase_amount FROM ORDERS;

-- 2. Calculate the Average Purchase Amount of All Orders

SELECT AVG(purch_amt) AS average_purchase_amount FROM ORDERS;

-- 3. Count the Number of Unique Salespeople

SELECT COUNT(DISTINCT salesman_id) AS number_of_salespeople FROM ORDERS;

-- 4. Count the Number of Customers

SELECT COUNT(customer_id) AS number_of_customers FROM CUSTOMER;

-- 5. Determine the Number of Customers Who Received at Least One Grade

SELECT COUNT(customer_id) AS number_of_customers_with_grade 
FROM CUSTOMER 
WHERE Grade IS NOT NULL;

-- 6. Find the Maximum Purchase Amount

SELECT MAX(purch_amt) AS maximum_purchase_amount FROM ORDERS;

-- 7. Find the Minimum Purchase Amount

SELECT MIN(purch_amt) AS minimum_purchase_amount FROM ORDERS;

-- 8. Find the Highest Grade of Customers in Each City

SELECT city, MAX(Grade) AS maximum_grade FROM CUSTOMER GROUP BY city;

-- 9. Find the Highest Purchase Amount Ordered by Each Customer

SELECT customer_id, MAX(purch_amt) AS maximum_purchase_amount FROM ORDERS 
GROUP BY customer_id;

-- 10. Find the Highest Purchase Amount Ordered by Each Customer on a Particular Date

SELECT ord_date, MAX(purch_amt) AS highest_purchase_amount
FROM ORDERS
GROUP BY ord_date;

