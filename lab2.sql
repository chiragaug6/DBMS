CREATE DATABASE DBMS;

CREATE TABLE Employees (
    EmpNo INT PRIMARY KEY,
    EmpName VARCHAR(100),
    JoiningDate DATE,
    Salary DECIMAL(10, 2),
    City VARCHAR(50)
);

INSERT INTO Employees (EmpNo, EmpName, JoiningDate, Salary, City) VALUES
(101, 'Keyur', '2002-05-01', 12000.00, 'Rajkot'),
(102, 'Hardik', '2004-02-15', 14000.00, 'Ahmedabad'),
(103, 'Kajal', '2006-03-14', 15000.00, 'Baroda'),
(104, 'Bhoomi', '2005-06-23', 12500.00, 'Ahmedabad'),
(105, 'Harmit', '2004-02-15', 14000.00, 'Rajkot');

-- PART 1

SELECT * FROM Employees;

-- 1.Display the name of employee whose salary is greater than 13000 and city is either Rajkot or Baroda. 

	SELECT EmpName FROM Employees WHERE Salary > 13000 AND City IN ('Rajkot', 'Baroda');

-- 2.Display the name of employee in ascending order by their name. 

	SELECT EmpName FROM Employees ORDER BY EmpName ASC;

-- 3.Retrieve all unique cities. 

	SELECT DISTINCT City FROM Employees;

-- 4.Update the city of Keyur and Bhoomi to NULL. 

	UPDATE Employees SET City = NULL WHERE EmpName IN ('Keyur', 'Bhoomi');

-- 5.Display the name of employee whose city is NULL. 

	SELECT EmpName FROM Employees WHERE City IS NULL;

-- 6.Delete all the records of Employee table having salary greater than and equals to 14000. 

	DELETE FROM Employees WHERE Salary >= 14000;

-- 7.Delete all the Employees who belongs to ‘RAJKOT’ city. 

	DELETE FROM Employees WHERE City = 'Rajkot';

-- 8.Delete all the Employees who joined after 1-1-2007. 

	DELETE FROM Employees WHERE JoiningDate > '2007-01-01';

-- 9.Delete all the records of Employee table. (Use Truncate)

	TRUNCATE TABLE Employees;

-- 10.Remove Employee table. (Use Drop) 

	DROP TABLE Employees;

-- 11.Delete all the records of DEPOSIT table. (Use Truncate)

	TRUNCATE TABLE DEPOSIT;

-- 12.Remove DEPOSIT table. (Use Drop)

	--DROP TABLE DEPOSIT;

-- 13.Remove BRANCH table. (Use Drop)

	--DROP TABLE BRANCH;

-- 14.Remove CUSTOMERS table. (Use Drop) 

	--DROP TABLE CUSTOMERS;

-- 15.Remove BORROW table. (Use Drop) 

	--DROP TABLE BORROW;

-- PART 2

CREATE TABLE ACCOUNT (
    ACTNO INT PRIMARY KEY,            -- Account Number, unique identifier for each transaction
    CNAME VARCHAR(100),               -- Customer Name
    BNAME VARCHAR(100),               -- Branch Name
    AMOUNT DECIMAL(10, 2),            -- Amount involved in the transaction
    ADATE DATE                        -- Date of the transaction
);

INSERT INTO ACCOUNT (ACTNO, CNAME, BNAME, AMOUNT, ADATE) VALUES
(101, 'ANIL', 'VRCE', 1000.00, '1995-03-01'),
(102, 'SUNIL', 'AJNI', 5000.00, '1996-01-04'),
(103, 'MEHUL', 'KAROLBAGH', 3500.00, '1995-11-17'),
(104, 'MADHURI', 'CHANDI', 1200.00, '1995-12-17'),
(105, 'PRMOD', 'M.G. ROAD', 3000.00, '1996-03-27'),
(106, 'SANDIP', 'ANDHERI', 2000.00, '1996-03-31'),
(107, 'SHIVANI', 'VIRAR', 1000.00, '1995-09-05'),
(108, 'KRANTI', 'NEHRU PLACE', 5000.00, '1995-07-02'),
(109, 'MINU', 'POWAI', 7000.00, '1995-08-10');

SELECT * FROM ACCOUNT;

-- 1. Retrieve all unique BNAME. 

	SELECT DISTINCT BNAME FROM ACCOUNT;

-- 2. Display the Cname in ascending order by their amount and if amount is same then in descending order by cname. 

	SELECT CNAME FROM ACCOUNT ORDER BY AMOUNT ASC, CNAME DESC;

-- 3. Update the BNAME of Anil and Shivani to NULL.

	UPDATE ACCOUNT SET BNAME = NULL WHERE CNAME IN ('ANIL', 'SHIVANI');

-- 4. Display the Cname of customers whose Bname is NULL. 

	SELECT CNAME FROM ACCOUNT WHERE BNAME IS NULL;

-- 5. Delete all the records of Account table having amount greater than and equals to 4000. 

	DELETE FROM ACCOUNT WHERE AMOUNT >= 4000;

-- 6. Delete all the accounts Bname is CHANDI.

	DELETE FROM ACCOUNT WHERE BNAME = 'CHANDI';

-- 7. Delete all the accounts having adate after 1-10-1995. 

	DELETE FROM ACCOUNT WHERE ADATE > '1995-10-01';

-- 8. Delete all the records of Account table. (Use Truncate)

	TRUNCATE TABLE ACCOUNT;

-- 9. Remove Account table. (Use Drop) 

	DROP TABLE ACCOUNT;

-- PART 3

/** 1. Display the Cname whose Bname is either AJNI or CHANDI and amount is greater than 3000 and sort the 
result in ascending order by their amount and if amount is same then in descending order by cname. **/

	SELECT CNAME FROM ACCOUNT WHERE BNAME IN ('AJNI', 'CHANDI') AND AMOUNT > 3000 ORDER BY AMOUNT ASC, CNAME DESC;

-- 2. Retrieve top 3 unique BNAME and sort them in ascending order on BNAME.

	SELECT TOP 3 BNAME FROM (SELECT DISTINCT BNAME FROM ACCOUNT) AS UniqueBnames ORDER BY BNAME ASC;

/** 3. Display the Cname whose ACTNO is greater than 103 and sort the result in ascending order by their amount 
and if amount is same then in descending order by cname. **/

	SELECT CNAME FROM ACCOUNT WHERE ACTNO > 103 ORDER BY AMOUNT ASC, CNAME DESC;

-- 4. Update the BNAME of Anil, Mehul and Shivani to NULL. 

	UPDATE ACCOUNT SET BNAME = NULL WHERE CNAME IN ('ANIL', 'MEHUL', 'SHIVANI');

-- 5. Display the Cname of customers whose Bname is NULL. 

	SELECT CNAME FROM ACCOUNT WHERE BNAME IS NULL;

-- 6. Update the amount of Anil to 5000.

	UPDATE ACCOUNT SET AMOUNT = 5000 WHERE CNAME = 'ANIL';

-- 7. Update amount of actno 109 to NULL. 

	UPDATE ACCOUNT SET AMOUNT = NULL WHERE ACTNO = 109;

-- 8. Retrieve all the records of account table as per their bname in descending order. 

	SELECT * FROM ACCOUNT ORDER BY BNAME DESC;

-- 9. Delete all the records of Account table. (Use Truncate) 

	TRUNCATE TABLE Transactions;

-- 10. Remove Account table. (Use Drop) 

	DROP TABLE Transactions;



	



