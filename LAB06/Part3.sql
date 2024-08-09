--1. Display Unique City Names

SELECT DISTINCT City FROM PERSON;

--2. List Out Department Names in Which More Than Two Persons

SELECT D.DepartmentName
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(P.PersonID) > 2;

--3. Combine Person Name’s First Three Characters with City Name’s Last Three Characters in a Single Column

SELECT SUBSTRING(P.PersonName, 1, 3) + SUBSTRING(P.City, LEN(P.City) - 2, 3) AS CombinedName
FROM PERSON P;

--4. Give a 10% Increment in Computer Department Employee’s Salary

UPDATE PERSON
SET Salary = Salary * 1.10
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM DEPARTMENT
    WHERE DepartmentName = 'Computer'
);

UPDATE P
SET P.Salary = P.Salary * 1.10
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Computer';

--5. Display All the Person Names Whose Joining Date Difference with the Current Date Is More Than 365 Days

SELECT PersonName
FROM PERSON
WHERE DATEDIFF(DAY, JoiningDate, GETDATE()) > 365;

