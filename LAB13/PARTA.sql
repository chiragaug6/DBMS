CREATE DATABASE LAB13;

USE LAB13;

CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    Salary DECIMAL(8,2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    City VARCHAR(100) NOT NULL,
    Age INT NULL,
    BirthDate DATETIME NOT NULL
);

CREATE TABLE PersonLog (
    PLogID INT PRIMARY KEY IDENTITY(1,1),
    PersonID INT NOT NULL,
    PersonName VARCHAR(250) NOT NULL,
    Operation VARCHAR(50) NOT NULL,
    UpdateDate DATETIME NOT NULL
);

--1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the Person table to display a message �Record is Affected.�


CREATE TRIGGER trg_Person_Affected
ON Person
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    PRINT 'Record is Affected.'
END;

--Create a trigger that fires on INSERT, UPDATE and DELETE operation on the Person table. For that, log all operations performed on the person table into PersonLog


CREATE TRIGGER trg_Person_Log
ON Person
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Log INSERT operations
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
        SELECT PersonID, PersonName, 'INSERT', GETDATE()
        FROM inserted;
    END

    -- Log UPDATE operations
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
        SELECT PersonID, PersonName, 'UPDATE', GETDATE()
        FROM inserted;
    END

    -- Log DELETE operations
    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
        SELECT PersonID, PersonName, 'DELETE', GETDATE()
        FROM deleted;
    END
END;



