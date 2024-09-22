--Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Person table. For
--that, log all operations performed on the person table into PersonLog.

CREATE TRIGGER trg_Person_Log_InsteadOf
ON Person
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    -- Log INSERT operation and perform the insert
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
        SELECT PersonID, PersonName, 'INSERT', GETDATE()
        FROM inserted;

        -- Perform the actual insert into the Person table
        INSERT INTO Person (PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate)
        SELECT PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate
        FROM inserted;
    END

    -- Log UPDATE operation and perform the update
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
        SELECT PersonID, PersonName, 'UPDATE', GETDATE()
        FROM inserted;

        -- Perform the actual update on the Person table
        UPDATE Person
        SET PersonName = inserted.PersonName,
            Salary = inserted.Salary,
            JoiningDate = inserted.JoiningDate,
            City = inserted.City,
            Age = inserted.Age,
            BirthDate = inserted.BirthDate
        FROM inserted
        WHERE Person.PersonID = inserted.PersonID;
    END

    -- Log DELETE operation and perform the delete
    IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
        SELECT PersonID, PersonName, 'DELETE', GETDATE()
        FROM deleted;

        -- Perform the actual delete from the Person table
        DELETE FROM Person
        WHERE PersonID IN (SELECT PersonID FROM deleted);
    END
END;


--Create a trigger that fires on INSERT operation on the Person table to convert person name into uppercase
--whenever the record is inserted.

CREATE TRIGGER trg_Person_UppercaseName
ON Person
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO Person (PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate)
    SELECT PersonID, UPPER(PersonName), Salary, JoiningDate, City, Age, BirthDate
    FROM inserted;
END;
