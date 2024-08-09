CREATE TABLE STUDENT (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50),
    Branch VARCHAR(10)
);

INSERT INTO STUDENT (Rno, Name, Branch) VALUES
(101, 'Raju', 'CE'),
(102, 'Amit', 'CE'),
(103, 'Sanjay', 'ME'),
(104, 'Neha', 'EC'),
(105, 'Meera', 'EE'),
(106, 'Mahesh', 'ME');

SELECT * FROM STUDENT


CREATE TABLE RESULT (
    Rno INT PRIMARY KEY,
    SPI FLOAT
);

INSERT INTO RESULT (Rno, SPI) VALUES
(101, 8.8),
(102, 9.2),
(103, 7.6),
(104, 8.2),
(105, 7.0),
(106, 8.9);

SELECT * FROM RESULT

CREATE TABLE EMPLOYEE (
    EmployeeNo VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    ManagerNo VARCHAR(10)
);

INSERT INTO EMPLOYEE (EmployeeNo, Name, ManagerNo) VALUES
('E01', 'Tarun', NULL),
('E02', 'Rohan', 'E02'),
('E03', 'Priya', 'E01'),
('E04', 'Milan', 'E03'),
('E05', 'Jay', 'E01'),
('E06', 'Anjana', 'E04');

SELECT * FROM EMPLOYEE


--1. Combine Information from Student and Result Table Using Cross Join

SELECT S.Rno, S.Name, S.Branch, R.Rno, R.SPI
FROM STUDENT S
CROSS JOIN RESULT R;

--2. Display Rno, Name, Branch, and SPI of All Students

SELECT S.Rno, S.Name, S.Branch, R.SPI
FROM STUDENT S
JOIN RESULT R ON S.Rno = R.Rno;

--3. Display Rno, Name, Branch, and SPI of CE Branch’s Students Only

SELECT S.Rno, S.Name, S.Branch, R.SPI
FROM STUDENT S
JOIN RESULT R ON S.Rno = R.Rno
WHERE S.Branch='CE';

--4. Display Rno, Name, Branch, and SPI of Students Other Than EC Branch
SELECT S.Rno, S.Name, S.Branch, R.SPI
FROM STUDENT S
JOIN RESULT R ON S.Rno = R.Rno
WHERE S.Branch!='EC';

--5. Display Average Result of Each Branch
SELECT S.Branch,AVG(R.SPI) AS AverageSPI
FROM STUDENT S
JOIN RESULT R ON S.Rno = R.Rno
GROUP BY S.Branch

--6. Display Average Result of Each Branch and Sort Them in Ascending Order by SPI

SELECT S.Branch,AVG(R.SPI) AS AverageSPI
FROM STUDENT S
JOIN RESULT R ON S.Rno = R.Rno
GROUP BY S.Branch
ORDER BY AverageSPI

--7. Display Average Result of CE and ME Branch

SELECT S.Branch,AVG(R.SPI) AS AverageSPI
FROM STUDENT S
JOIN RESULT R ON S.Rno = R.Rno
WHERE S.Branch IN('CE','ME')
GROUP BY S.Branch

--8. Perform the Left Outer Join on Student and Result Tables

SELECT  S.Rno, S.Name, S.Branch, R.SPI
FROM STUDENT S
LEFT JOIN RESULT R ON S.Rno = R.Rno

--9. Perform the Right Outer Join on Student and Result Tables

SELECT  S.Rno, S.Name, S.Branch, R.SPI
FROM STUDENT S
RIGHT JOIN RESULT R ON S.Rno = R.Rno

--10. Perform the Full Outer Join on Student and Result Tables

SELECT  S.Rno, S.Name, S.Branch, R.SPI
FROM STUDENT S
FULL JOIN RESULT R ON S.Rno = R.Rno

--11. Retrieve the Names of Employees Along with Their Manager Name (SELF JOIN)

SELECT E1.Name AS EmployeeName, E2.Name AS ManagerName
FROM EMPLOYEE E1
LEFT JOIN EMPLOYEE E2 ON E1.ManagerNo = E2.EmployeeNo;









	
