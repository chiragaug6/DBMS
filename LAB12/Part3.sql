--1. Procedure that Accepts Department Name and Returns Person Count

CREATE PROCEDURE GetPersonCountByDepartment
    @DepartmentName VARCHAR(100)
AS
BEGIN
    SELECT 
        COUNT(*) AS PersonCount
    FROM 
        PERSON P
    INNER JOIN Department D ON P.DepartmentID = D.DepartmentID
    WHERE 
        D.DepartmentName = @DepartmentName;
END;
GO

--2. Procedure that Accepts Department Name and Designation as Parameters and Returns Specific Details Based on Test Cases

CREATE PROCEDURE GetPersonsByDeptAndDesignation
    @DepartmentName VARCHAR(100) = NULL,
    @DesignationName VARCHAR(100) = NULL
AS
BEGIN
    SELECT 
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
        (@DepartmentName IS NULL OR D.DepartmentName = @DepartmentName)
        AND (@DesignationName IS NULL OR DS.DesignationName = @DesignationName);
END;
GO

--3. Create Procedure that returns DepartmentID, DepartmentName & Count of all person belongs to that 
--department. i.e. 1 | Admin | 2 

CREATE PROCEDURE GetDepartmentWithPersonCount
AS
BEGIN
    SELECT 
        D.DepartmentID,
        D.DepartmentName,
        COUNT(P.WorkerID) AS PersonCount
    FROM 
        Department D
    LEFT JOIN PERSON P ON D.DepartmentID = P.DepartmentID
    GROUP BY 
        D.DepartmentID,
        D.DepartmentName;
END;
GO


