CREATE TABLE SALESMAN (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    commission DECIMAL(4, 2)
);

CREATE TABLE CUSTOMER (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    Grade INT,
    salesman_id INT REFERENCES SALESMAN(salesman_id) 
);

CREATE TABLE ORDERS (
    ord_no INT,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT REFERENCES CUSTOMER(customer_id),
    salesman_id INT REFERENCES SALESMAN(salesman_id)
);

select * from ORDERS

INSERT INTO ORDERS (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.40, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.60, '2012-04-25', 3002, 5001),
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001);

SELECT * FROM SALESMAN;

INSERT INTO SALESMAN VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

SELECT * FROM CUSTOMER;

INSERT INTO CUSTOMER (customer_id, cust_name, city, Grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);


--1. Find the salesperson and customer who reside in the same city. Return Salesman, cust_name, and city.

SELECT 
    s.name AS Salesman,
    c.cust_name AS Customer,
    c.city AS City
FROM 
    SALESMAN s
JOIN 
    CUSTOMER c ON s.city = c.city;

--2. Find orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, and city.

SELECT 
    o.ord_no,
    o.purch_amt,
    c.cust_name,
    c.city
FROM 
    ORDERS o
JOIN 
    CUSTOMER c ON o.customer_id = c.customer_id
WHERE 
    o.purch_amt BETWEEN 500 AND 2000;

--3. Find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, and commission.

SELECT 
    c.cust_name AS Customer,
    c.city AS City,
    s.name AS Salesman,
    s.Commission
FROM 
    CUSTOMER c
JOIN 
    SALESMAN s ON c.salesman_id = s.salesman_id;

--4. Find salespeople who received commissions of more than 12 percent. Return Customer Name, customer city, Salesman, and commission.

SELECT 
    c.cust_name AS Customer,
    c.city AS Customer_City,
    s.name AS Salesman,
    s.commission
FROM 
    CUSTOMER c
JOIN 
    SALESMAN s ON c.salesman_id = s.salesman_id
WHERE 
    s.commission > 0.12;

--5. Locate those salespeople who do not live in the same city as their customers and have received a commission of more than 12%. Return Customer Name, customer city, Salesman, salesman city, and commission.

SELECT 
    c.cust_name AS Customer,
    c.city AS Customer_City,
    s.name AS Salesman,
    s.city AS Salesman_City,
    s.commission
FROM 
    CUSTOMER c
JOIN 
    SALESMAN s ON c.salesman_id = s.salesman_id
WHERE 
    s.city <> c.city
    AND s.commission > 0.12;

--6. Find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, and commission.

SELECT 
    o.ord_no,
    o.ord_date,
    o.purch_amt,
    c.cust_name AS Customer,
    c.Grade,
    s.name AS Salesman,
    s.commission
FROM 
    ORDERS o
JOIN 
    CUSTOMER c ON o.customer_id = c.customer_id
JOIN 
    SALESMAN s ON c.salesman_id = s.salesman_id;

--7. Join the tables SALESMAN, CUSTOMER, and ORDERS so that the same column of each table appears once and only the relational rows are returned.

SELECT 
    o.ord_no,
    o.purch_amt,
    o.ord_date,
    c.cust_name,
    c.city AS Customer_City,
    c.Grade,
    s.name AS Salesman,
    s.city AS Salesman_City,
    s.commission
FROM 
    ORDERS o
JOIN 
    CUSTOMER c ON o.customer_id = c.customer_id
JOIN 
    SALESMAN s ON c.salesman_id = s.salesman_id;

--8. Display the customer name, customer city, grade, salesman, and salesman city. The results should be sorted by ascending customer_id.

SELECT 
    c.cust_name AS Customer,
    c.city AS Customer_City,
    c.Grade,
    s.name AS Salesman,
    s.city AS Salesman_City
FROM 
    CUSTOMER c
JOIN 
    SALESMAN s ON c.salesman_id = s.salesman_id
ORDER BY 
    c.customer_id ASC;

--9. Find customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, and salesman city. The result should be ordered by ascending customer_id.

SELECT 
    c.cust_name AS Customer,
    c.city AS Customer_City,
    c.Grade,
    s.name AS Salesman,
    s.city AS Salesman_City
FROM 
    CUSTOMER c
JOIN 
    SALESMAN s ON c.salesman_id = s.salesman_id
WHERE 
    c.Grade < 300
ORDER BY 
    c.customer_id ASC;

--10. Write a SQL statement to make a report with customer name, city, order number, order date, and order  amount in ascending order according to the order date to determine whether any of the existing customers 
--have placed an order or not. 

SELECT c.cust_name AS Customer, c.city AS City, o.ord_no AS Order_Number, o.ord_date AS Order_Date, o.purch_amt AS Order_Amount
FROM CUSTOMER c
LEFT JOIN ORDERS o ON c.customer_id = o.customer_id
ORDER BY o.ord_date ASC;







