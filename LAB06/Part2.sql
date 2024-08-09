CREATE TABLE PERSON (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    JoiningDate DATE,
    City VARCHAR(50)
);

INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES
(101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar');

CREATE TABLE DEPARTMENT (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    DepartmentCode VARCHAR(10),
    Location VARCHAR(50)
);

INSERT INTO DEPARTMENT (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES
(1, 'Admin', 'Admin', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block');

--1. Find All Persons with Their Department Name & Code

SELECT P.PersonID, P.PersonName, D.DepartmentName, D.DepartmentCode
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID;

--2. Give Department Wise Maximum & Minimum Salary with Department Name
SELECT D.DepartmentName, MAX(P.Salary) AS MaxSalary, MIN(P.Salary) AS MinSalary
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;

--3. Find All Departments Whose Total Salary Is Exceeding 100,000

SELECT D.DepartmentName, SUM(P.Salary) AS TotalSalary
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
HAVING SUM(P.Salary) > 100000;

--4. Retrieve Person Name, Salary & Department Name Who Belongs to Jamnagar City

SELECT P.PersonName,P.Salary, D.DepartmentName
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
WHERE P.CITY='Jamnagar';

--5. Find All Persons Who Do Not Belong to Any Department

SELECT * FROM PERSON WHERE DepartmentID IS NULL

--6. Find Department Wise Person Counts

SELECT D.DepartmentName,COUNT(P.PersonID)
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName

--7. Find Average Salary of Persons Who Belong to Ahmedabad City

SELECT AVG(SALARY) FROM PERSON WHERE CITY='Ahmedabad'

--8. Produce Output Like: "<PersonName> earns <Salary> from department <DepartmentName> monthly."

SELECT P.PersonName + ' earns ' + CAST(P.Salary AS VARCHAR) + ' from department ' + D.DepartmentName + ' monthly.' AS Output
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID;

--9. List All Departments That Have No Persons

SELECT D.DepartmentName
FROM DEPARTMENT D
LEFT JOIN PERSON P ON D.DepartmentID = P.DepartmentID
WHERE P.PersonID IS NULL;

--10. Find City & Department Wise Total, Average & Maximum Salaries

SELECT P.City, D.DepartmentName, SUM(P.Salary) AS TotalSalary, AVG(P.Salary) AS AverageSalary, MAX(P.Salary) AS MaxSalary
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
GROUP BY P.City, D.DepartmentName;









