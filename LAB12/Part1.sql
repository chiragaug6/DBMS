--1. Create Procedures for INSERT, UPDATE, and DELETE Operations

--Department Table

-- INSERT Procedure for Department
CREATE PROCEDURE InsertDepartment
    @DepartmentID INT,
    @DepartmentName VARCHAR(100)
AS
BEGIN
    INSERT INTO Department (DepartmentID, DepartmentName)
    VALUES (@DepartmentID, @DepartmentName);
END;
GO

-- UPDATE Procedure for Department
CREATE PROCEDURE UpdateDepartment
    @DepartmentID INT,
    @DepartmentName VARCHAR(100)
AS
BEGIN
    UPDATE Department
    SET DepartmentName = @DepartmentName
    WHERE DepartmentID = @DepartmentID;
END;
GO

-- DELETE Procedure for Department
CREATE PROCEDURE DeleteDepartment
    @DepartmentID INT
AS
BEGIN
    DELETE FROM Department
    WHERE DepartmentID = @DepartmentID;
END;
GO


--Designation Table:

-- INSERT Procedure for Designation
CREATE PROCEDURE InsertDesignation
    @DesignationID INT,
    @DesignationName VARCHAR(100)
AS
BEGIN
    INSERT INTO Designation (DesignationID, DesignationName)
    VALUES (@DesignationID, @DesignationName);
END;
GO

-- UPDATE Procedure for Designation
CREATE PROCEDURE UpdateDesignation
    @DesignationID INT,
    @DesignationName VARCHAR(100)
AS
BEGIN
    UPDATE Designation
    SET DesignationName = @DesignationName
    WHERE DesignationID = @DesignationID;
END;
GO

-- DELETE Procedure for Designation
CREATE PROCEDURE DeleteDesignation
    @DesignationID INT
AS
BEGIN
    DELETE FROM Designation
    WHERE DesignationID = @DesignationID;
END;
GO

--Person Table:

-- INSERT Procedure for Person
CREATE PROCEDURE InsertPerson
    @FirstName VARCHAR(100),
    @LastName VARCHAR(100),
    @Salary DECIMAL(8,2),
    @JoiningDate DATETIME,
    @DepartmentID INT = NULL,
    @DesignationID INT = NULL
AS
BEGIN
    INSERT INTO PERSON (FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID)
    VALUES (@FirstName, @LastName, @Salary, @JoiningDate, @DepartmentID, @DesignationID);
END;
GO

-- UPDATE Procedure for Person
CREATE PROCEDURE UpdatePerson
    @WorkerID INT,
    @FirstName VARCHAR(100),
    @LastName VARCHAR(100),
    @Salary DECIMAL(8,2),
    @JoiningDate DATETIME,
    @DepartmentID INT = NULL,
    @DesignationID INT = NULL
AS
BEGIN
    UPDATE PERSON
    SET FirstName = @FirstName,
        LastName = @LastName,
        Salary = @Salary,
        JoiningDate = @JoiningDate,
        DepartmentID = @DepartmentID,
        DesignationID = @DesignationID
    WHERE WorkerID = @WorkerID;
END;
GO

-- DELETE Procedure for Person
CREATE PROCEDURE DeletePerson
    @WorkerID INT
AS
BEGIN
    DELETE FROM PERSON
    WHERE WorkerID = @WorkerID;
END;
GO

--2. Create Procedures for SELECT BY PRIMARY KEY

--Department Table:

CREATE PROCEDURE SelectDepartmentByPrimaryKey
    @DepartmentID INT
AS
BEGIN
    SELECT * FROM Department
    WHERE DepartmentID = @DepartmentID;
END;
GO

--Designation Table:

CREATE PROCEDURE SelectDesignationByPrimaryKey
    @DesignationID INT
AS
BEGIN
    SELECT * FROM Designation
    WHERE DesignationID = @DesignationID;
END;
GO

--Person Table:

CREATE PROCEDURE SelectPersonByPrimaryKey
    @WorkerID INT
AS
BEGIN
    SELECT * FROM PERSON
    WHERE WorkerID = @WorkerID;
END;
GO

--3. Create Procedures for SELECT with JOIN (if Foreign Key is Available)

--Person Table with Department and Designation:

CREATE PROCEDURE SelectPersonWithDepartmentAndDesignation
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
    LEFT JOIN Designation DS ON P.DesignationID = DS.DesignationID;
END;
GO

--4. Create a Procedure to Show Details of the First 3 Persons

CREATE PROCEDURE SelectFirstThreePersons
AS
BEGIN
    SELECT TOP 3 * FROM PERSON
    ORDER BY WorkerID;
END;
GO

