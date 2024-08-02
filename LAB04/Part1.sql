CREATE TABLE EMPLOYEE (
    EID INT PRIMARY KEY,
    EName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    JoiningDate DATE,
    City VARCHAR(50)
);

INSERT INTO EMPLOYEE (EID, EName, Department, Salary, JoiningDate, City) VALUES
(101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot'),
(102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad'),
(103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda'),
(104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot'),
(105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar'),
(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad'),
(107, 'Neha', 'HR', 34000, '1991-12-25', 'Rajkot');

SELECT * FROM EMPLOYEE

--1. Display the Highest, Lowest, Total, and Average salary of all employees. Label the columns Maximum, 
--Minimum, Total_Sal and Average_Sal, respectively. 

SELECT 
    MAX(Salary) AS Maximum,
    MIN(Salary) AS Minimum,
    SUM(Salary) AS Total_Sal,
    AVG(Salary) AS Average_Sal
FROM 
    EMPLOYEE;

--2. Find total number of employees of EMPLOYEE table. 

SELECT COUNT(*) AS Total_Employees FROM EMPLOYEE;

--3. Give maximum salary from IT department. 

SELECT MAX(Salary) AS Max_IT_Salary FROM EMPLOYEE WHERE Department = 'IT';

--4. Count total number of cities of employee without duplication. 

SELECT COUNT(DISTINCT City) AS Total_Cities FROM EMPLOYEE;

--5. Display city with the total number of employees belonging to each city. 

SELECT City,COUNT(*) AS NumberOfEmployees FROM EMPLOYEE GROUP BY City;

--6. Display city having more than one employee.

SELECT City FROM EMPLOYEE
GROUP BY 
    City
HAVING 
    COUNT(*) > 1;

--7. Give total salary of each department of EMPLOYEE table. 

SELECT 
    Department,
    SUM(Salary) AS Total_Salary
FROM 
    EMPLOYEE
GROUP BY 
    Department;

--8. Give average salary of each department of EMPLOYEE table without displaying the respective department name. 

SELECT 
    AVG(Salary) AS Average_Salary
FROM 
    EMPLOYEE
GROUP BY 
    Department;

--9. Give minimum salary of employee who belongs to Ahmedabad.

SELECT 
    MIN(Salary) AS Min_Salary_Ahmedabad
FROM 
    EMPLOYEE
WHERE 
    City = 'Ahmedabad';

--10.  List the departments having total salaries more than 50000 and located in city Rajkot.

SELECT 
    Department
FROM 
    EMPLOYEE
WHERE 
    City = 'Rajkot'
GROUP BY 
    Department
HAVING 
    SUM(Salary) > 50000;

--11.  Count the number of employees living in Rajkot. 

SELECT 
    COUNT(*) AS EmployeesInRajkot
FROM 
    EMPLOYEE
WHERE 
    City = 'Rajkot';

--12.  Display the difference between the highest and lowest salaries. Label the column DIFFERENCE. 

SELECT 
    MAX(Salary) - MIN(Salary) AS DIFFERENCE
FROM 
    EMPLOYEE;

--13. Display the total number of employees hired before 1st January, 1991. 

SELECT 
    COUNT(*) AS EmployeesHiredBefore1991
FROM 
    EMPLOYEE
WHERE 
    JoiningDate < '1991-01-01';

--14. Display total salary of each department with total salary exceeding 35000 and sort the list by total salary. 

SELECT 
    Department,
    SUM(Salary) AS Total_Salary
FROM 
    EMPLOYEE
GROUP BY 
    Department
HAVING 
    SUM(Salary) > 35000
ORDER BY 
    Total_Salary;

--15. List out department names in which more than two employees. 

SELECT 
    Department
FROM 
    EMPLOYEE
GROUP BY 
    Department
HAVING 
    COUNT(*) > 2;

