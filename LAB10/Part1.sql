CREATE TABLE STUDENT2 (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT
);

INSERT INTO STUDENT2 (Rno, Name, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

SELECT * FROM STUDENT2;

CREATE TABLE ACADEMIC (
    Rno INT PRIMARY KEY,
    SPI DECIMAL(3, 2),
    Bklog INT
);

INSERT INTO ACADEMIC (Rno, SPI, Bklog) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

SELECT * FROM ACADEMIC;

CREATE TABLE DEPARTMENT2 (
    DID INT PRIMARY KEY,
    DName VARCHAR(50)
);

INSERT INTO DEPARTMENT2 (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');

SELECT * FROM DEPARTMENT2;

--1. Display details of students who are from the computer department.
SELECT *
FROM STUDENT2
WHERE DID = (SELECT DID FROM DEPARTMENT2 WHERE DName = 'Computer');

--2. Display the names of students whose SPI is more than 8.
SELECT Name
FROM STUDENT2
WHERE Rno IN (SELECT Rno FROM ACADEMIC WHERE SPI > 8);

--3. Display details of students from the computer department who belong to Rajkot city.
-- Query to display details of students from the Computer department who belong to Rajkot
SELECT *
FROM STUDENT2
WHERE DID = (SELECT DID FROM DEPARTMENT2 WHERE DName = 'Computer') AND City = 'Rajkot';

--4. Find the total number of students in the electrical department.

SELECT COUNT(*)
FROM STUDENT2
WHERE DID = (SELECT DID FROM DEPARTMENT2 WHERE DName = 'Electrical');

--5. Display the name of the student who has the maximum SPI.

SELECT Name
FROM STUDENT2
WHERE Rno = (SELECT TOP 1 Rno FROM ACADEMIC ORDER BY SPI DESC);

--6. Display details of students having more than 1 backlog.

SELECT *
FROM STUDENT2
WHERE Rno IN (SELECT Rno FROM ACADEMIC WHERE Bklog > 1);

--7. Display the name of the student who has the second-highest SPI.

SELECT Name
FROM STUDENT2
WHERE Rno = (
    SELECT TOP 1 Rno
    FROM ACADEMIC
    WHERE SPI < (SELECT MAX(SPI) FROM ACADEMIC)
    ORDER BY SPI DESC
);

--8. Display the names of students who are either from the computer department or from the mechanical department.

SELECT Name
FROM STUDENT2
WHERE DID IN (SELECT DID FROM DEPARTMENT2 WHERE DName IN ('Computer', 'Mechanical'));

--9. Display the names of students who are in the same department as student 102.

SELECT Name
FROM STUDENT2
WHERE DID = (SELECT DID FROM STUDENT WHERE Rno = 102);

--10. Display the names of students whose SPI is more than 9 and who are from the electrical department.

SELECT Name
FROM STUDENT2
WHERE Rno IN (
    SELECT Rno
    FROM ACADEMIC
    WHERE SPI > 9
) AND DID = (SELECT DID FROM DEPARTMENT2 WHERE DName = 'Electrical');









