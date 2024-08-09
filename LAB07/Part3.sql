--1. Find All Departments Whose Total Salary Is Exceeding 100,000

SELECT D.DepartmentName
FROM DEPARTMENT D
JOIN PERSON P ON D.DepartmentID = P.DepartmentID
GROUP BY D.DepartmentName
HAVING SUM(P.Salary) > 100000;

--2. List all departments who have no person. 

SELECT D.DepartmentName
FROM DEPARTMENT D
LEFT JOIN PERSON P ON D.DepartmentID = P.DepartmentID
WHERE P.PersonID IS NULL;

--3. List out department names in which more than two persons are working. 

SELECT D.DepartmentName
FROM PERSON P
JOIN DEPARTMENT D ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(P.PersonID) > 2;

--4. Give a 10% increment in the Computer department employee’s salary. (Use Update) 

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

--5. Calculate Employee Experience in Years, Months & Days with Respect to Their Joining Date

SELECT PersonName,
       JoiningDate,
       DATEDIFF(YEAR, JoiningDate, GETDATE()) AS YearsExperience,
       DATEDIFF(MONTH, DATEADD(YEAR, DATEDIFF(YEAR, JoiningDate, GETDATE()), JoiningDate), GETDATE()) AS MonthsExperience,
       DATEDIFF(DAY, DATEADD(MONTH, DATEDIFF(MONTH, DATEADD(YEAR, DATEDIFF(YEAR, JoiningDate, GETDATE()), JoiningDate), GETDATE()), DATEADD(YEAR, DATEDIFF(YEAR, JoiningDate, GETDATE()), JoiningDate)), GETDATE()) AS DaysExperience
FROM PERSON;