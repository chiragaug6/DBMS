--1. Procedure to Return All Workers in a Specific Department

CREATE PROCEDURE GetWorkersByDepartment
    @DepartmentName VARCHAR(100)
AS
BEGIN
    SELECT 
        P.WorkerID,
        P.FirstName,
        P.LastName,
        P.Salary,
        P.JoiningDate,
        D.DepartmentName,
        DS.DesignationName
    FROM 
        PERSON P
    INNER JOIN Department D ON P.DepartmentID = D.DepartmentID
    LEFT JOIN Designation DS ON P.DesignationID = DS.DesignationID
    WHERE 
        D.DepartmentName = @DepartmentName;
END;
GO


--2. Procedure to Return Workers' First Name, Salary, Joining Date, and Department Name Based on Department and Designation Name

CREATE PROCEDURE GetWorkersByDepartmentAndDesignation
    @DepartmentName VARCHAR(100),
    @DesignationName VARCHAR(100)
AS
BEGIN
    SELECT 
        P.FirstName,
        P.Salary,
        P.JoiningDate,
        D.DepartmentName
    FROM 
        PERSON P
    INNER JOIN Department D ON P.DepartmentID = D.DepartmentID
    INNER JOIN Designation DS ON P.DesignationID = DS.DesignationID
    WHERE 
        D.DepartmentName = @DepartmentName AND 
        DS.DesignationName = @DesignationName;
END;
GO

--3. Procedure to Display All Details of a Worker Based on First Name, Along with Department and Designation Name

CREATE PROCEDURE GetWorkerDetailsByFirstName
    @FirstName VARCHAR(100)
AS
BEGIN
    SELECT 
        P.WorkerID,
        P.FirstName,
        P.LastName,
        P.Salary,
        P.JoiningDate,
        D.DepartmentName,
        DS.DesignationName
    FROM 
        PERSON P
    LEFT JOIN Department D ON P.DepartmentID = D.DepartmentID
    LEFT JOIN Designation DS ON P.DesignationID = DS.DesignationID
    WHERE 
        P.FirstName = @FirstName;
END;
GO

--4. Procedure to Display Department-Wise Maximum, Minimum, and Total Salaries

CREATE PROCEDURE GetDepartmentWiseSalaryStats
AS
BEGIN
    SELECT 
        D.DepartmentName,
        MAX(P.Salary) AS MaxSalary,
        MIN(P.Salary) AS MinSalary,
        SUM(P.Salary) AS TotalSalary
    FROM 
        PERSON P
    INNER JOIN Department D ON P.DepartmentID = D.DepartmentID
    GROUP BY 
        D.DepartmentName;
END;
GO

--5. Procedure to Display Designation-Wise Average and Total Salaries

CREATE PROCEDURE GetDesignationWiseSalaryStats
AS
BEGIN
    SELECT 
        DS.DesignationName,
        AVG(P.Salary) AS AvgSalary,
        SUM(P.Salary) AS TotalSalary
    FROM 
        PERSON P
    INNER JOIN Designation DS ON P.DesignationID = DS.DesignationID
    GROUP BY 
        DS.DesignationName;
END;
GO
