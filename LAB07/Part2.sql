--1. Find All Persons with Their Department Name & Code

SELECT P.PersonName, D.DepartmentName, D.DepartmentCode
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID;

--2. Find the Person's Name Whose Department Is Located in C-Block

SELECT P.PersonName
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
WHERE D.Location = 'C-Block';


--3. Retrieve Person Name, Salary & Department Name Who Belongs to Jamnagar City

SELECT P.PersonName, P.Salary, D.DepartmentName
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
WHERE P.City = 'Jamnagar';

--4. Retrieve Person Name, Salary & Department Name Who Does Not Belong to Rajkot City

SELECT P.PersonName, P.Salary, D.DepartmentName
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
WHERE P.City <> 'Rajkot';


--5. Retrieve Person’s Name of the Person Who Joined the Civil Department After 1-Aug-2001

SELECT P.PersonName
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Civil'
AND P.JoiningDate > '2001-08-01';

--6. Find Details of All Persons Who Belong to the Computer Department

SELECT P.PersonName, P.Salary, P.City, P.JoiningDate
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Computer';

--7. Display All the Person's Name with the Department Whose Joining Date Difference with the Current Date Is More Than 365 Days

SELECT P.PersonName, D.DepartmentName
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
WHERE DATEDIFF(DAY, P.JoiningDate, GETDATE()) > 365;

--8. Find Department Wise Person Counts

SELECT D.DepartmentName, COUNT(P.PersonID) AS PersonCount
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;

--9. Give Department Wise Maximum & Minimum Salary with Department Name

SELECT D.DepartmentName, MAX(P.Salary) AS MaxSalary, MIN(P.Salary) AS MinSalary
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;


--10. Find City Wise Total, Average, Maximum, and Minimum Salary

SELECT P.City, SUM(P.Salary) AS TotalSalary, AVG(P.Salary) AS AverageSalary, 
       MAX(P.Salary) AS MaxSalary, MIN(P.Salary) AS MinSalary
FROM PERSON P
GROUP BY P.City;

--11. Find the Average Salary of a Person Who Belongs to Ahmedabad City

SELECT AVG(P.Salary) AS AverageSalary
FROM PERSON P
WHERE P.City = 'Ahmedabad';

--12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department.

SELECT P.PersonName + ' lives in ' + P.City + ' and works in ' + D.DepartmentName + ' Department.' AS Output
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID;

--13. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly.

SELECT P.PersonName + ' earns ' + CAST(P.Salary AS VARCHAR) + ' from ' + D.DepartmentName + ' department monthly.' AS Output
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID;

--14. Find City & Department Wise Total, Average & Maximum Salaries

SELECT P.City, D.DepartmentName, 
       SUM(P.Salary) AS TotalSalary, AVG(P.Salary) AS AverageSalary, MAX(P.Salary) AS MaxSalary
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
GROUP BY P.City, D.DepartmentName;

--15. Find All Persons Who Do Not Belong to Any Department

SELECT P.PersonName
FROM PERSON P
WHERE P.DepartmentID IS NULL;

