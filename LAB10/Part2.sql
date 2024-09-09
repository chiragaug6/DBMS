CREATE TABLE COMPANY_MASTER (
    COM_ID INT PRIMARY KEY,
    COM_NAME VARCHAR(50)
);

INSERT INTO COMPANY_MASTER (COM_ID, COM_NAME) VALUES
(11, 'Samsung'),
(12, 'iBall'),
(13, 'Epsion'),
(14, 'Zebronics'),
(15, 'Asus'),
(16, 'Frontech');

CREATE TABLE ITEM_MASTER (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(50),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM INT FOREIGN KEY REFERENCES COMPANY_MASTER(COM_ID)
);

INSERT INTO ITEM_MASTER (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES
(101, 'Mother Board', 3200, 15),
(102, 'Key Board', 450, 16),
(103, 'ZIP drive', 250, 14),
(104, 'Speaker', 550, 16),
(105, 'Monitor', 5000, 11),
(106, 'DVD drive', 900, 12),
(107, 'CD drive', 800, 12),
(108, 'Printer', 2600, 13),
(109, 'Refill cartridge', 350, 13),
(110, 'Mouse', 250, 12);

CREATE TABLE EMP_DETAILS (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME VARCHAR(50),
    EMP_LNAME VARCHAR(50),
    EMP_DEPT INT
);

INSERT INTO EMP_DETAILS (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES
(127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57);

CREATE TABLE EMP_DEPARTMENT (
    DPT_CODE INT PRIMARY KEY,
    DPT_NAME VARCHAR(50),
    DPT_ALLOTMENT DECIMAL(10, 2)
);

INSERT INTO EMP_DEPARTMENT (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES
(57, 'IT', 65000),
(63, 'Finance', 15000),
(47, 'HR', 240000),
(27, 'RD', 55000),
(89, 'QC', 75000);
	

--1. Write a SQL query to calculate the average price of each manufacturer's product along with their name. 
--Return Average Price and Company. 

SELECT 
    (SELECT AVG(p.Price) 
     FROM Products p 
     WHERE p.COM_ID = c.COM_ID) AS [Average Price], 
    c.COM_NAME AS Company
FROM 
    COMPANY_MASTER c;

--2.Calculate the average price of each manufacturer's product where the price is 350 or more using a subquery.

SELECT 
    (SELECT AVG(p.Price) 
     FROM Products p 
     WHERE p.COM_ID = c.COM_ID AND p.Price >= 350) AS [Average Price], 
    c.COM_NAME AS Company
FROM 
    COMPANY_MASTER c;

--3.Find the most expensive product of each company using a subquery.

SELECT 
    p.ProductName, 
    p.Price, 
    c.COM_NAME AS Company
FROM 
    Products p
JOIN 
    COMPANY_MASTER c ON p.COM_ID = c.COM_ID
WHERE 
    p.Price = (SELECT MAX(p2.Price) 
               FROM Products p2 
               WHERE p2.COM_ID = p.COM_ID);

--4. Find employees whose last name is Gabriel or Dosio using a subquery.

SELECT 
    emp_idno, 
    emp_fname, 
    emp_lname, 
    emp_dept
FROM 
    Employees
WHERE 
    emp_lname IN (SELECT 'Gabriel' UNION SELECT 'Dosio');

--5.Find the employees who work in department 89 or 63 using a subquery

SELECT 
    emp_idno, 
    emp_fname, 
    emp_lname, 
    emp_dept
FROM 
    Employees
WHERE 
    emp_dept IN (SELECT DISTINCT emp_dept 
                 FROM Employees 
                 WHERE emp_dept IN (89, 63));





