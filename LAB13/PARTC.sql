--Create a trigger that fires on INSERT operation on person table, which calculates the age and update that
--age in Person table.

CREATE TRIGGER trg_Person_CalculateAge
ON Person
AFTER INSERT
AS
BEGIN
    -- Calculate age based on the BirthDate and update the Person table
    UPDATE Person
    SET Age = DATEDIFF(YEAR, BirthDate, GETDATE()) - 
              CASE 
                  WHEN MONTH(BirthDate) > MONTH(GETDATE()) OR 
                       (MONTH(BirthDate) = MONTH(GETDATE()) AND DAY(BirthDate) > DAY(GETDATE()))
                  THEN 1
                  ELSE 0
              END
    WHERE PersonID IN (SELECT PersonID FROM inserted);
END;


--Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints ‘Record
--deleted successfully from PersonLog’.

CREATE TRIGGER trg_PersonLog_Delete
ON PersonLog
AFTER DELETE
AS
BEGIN
    PRINT 'Record deleted successfully from PersonLog';
END;
