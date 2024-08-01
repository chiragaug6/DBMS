CREATE TABLE CUSTOMER2 (
    CID INT,
    Name VARCHAR(100),
    Age INT,
    Address VARCHAR(255),
    Salary DECIMAL(10, 2)
);

INSERT INTO CUSTOMER2 (CID, Name, Age, Address, Salary) VALUES
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 1500.00),
(3, 'Kaushik', 23, 'Kota', 2000.00),
(4, 'Chaitali', 25, 'Mumbai', 6500.00),
(5, 'Hardik', 27, 'Bhopal', 8500.00),
(6, 'Komal', 22, 'Hyderabad', 4500.00),
(7, 'Muffy', 24, 'Indore', 10000.00);

--1. Display all the records from the CUSTOMERS table, where the SALARY starts with 200.

SELECT * FROM CUSTOMER2 WHERE Salary LIKE '200%';

--2. Displays all the records from the CUSTOMERS table with the NAME that has 'al' in any position. 

SELECT * FROM CUSTOMER2 WHERE Name LIKE '%al%';

--3. Display all the records from the CUSTOMERS table where the Name starts with K and is at least 4 characters in length. \

SELECT * FROM CUSTOMER2 WHERE Name LIKE 'K___%';

--4. Display all the records from the CUSTOMERS table, where the NAME has 'm' in the third position.

SELECT * FROM CUSTOMER2 WHERE Name LIKE '__m%';

--5. Retrieves the records of the customers whose name starts with C and ends with i, or customers whose name ends with k. 

SELECT * FROM CUSTOMER2 WHERE (Name LIKE 'C%i') OR (Name LIKE '%k');

--6. Retrieves all the customers whose name does not start with K. 

SELECT * FROM CUSTOMER2 WHERE Name NOT LIKE 'K%';