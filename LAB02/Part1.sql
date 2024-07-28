
-- 1.Display the name of employee whose salary is greater than 13000 and city is either Rajkot or Baroda. 

	SELECT EmpName FROM Employees WHERE Salary > 13000 AND City IN ('Rajkot', 'Baroda');

-- 2.Display the name of employee in ascending order by their name. 

	SELECT EmpName FROM Employees ORDER BY EmpName ASC;

-- 3.Retrieve all unique cities. 

	SELECT DISTINCT City FROM Employees;

-- 4.Update the city of Keyur and Bhoomi to NULL. 

	UPDATE Employees SET City = NULL WHERE EmpName IN ('Keyur', 'Bhoomi');

-- 5.Display the name of employee whose city is NULL. 

	SELECT EmpName FROM Employees WHERE City IS NULL;

-- 6.Delete all the records of Employee table having salary greater than and equals to 14000. 

	DELETE FROM Employees WHERE Salary >= 14000;

-- 7.Delete all the Employees who belongs to  RAJKOT  city. 

	DELETE FROM Employees WHERE City = 'Rajkot';

-- 8.Delete all the Employees who joined after 1-1-2007. 

	DELETE FROM Employees WHERE JoiningDate > '2007-01-01';

-- 9.Delete all the records of Employee table. (Use Truncate)

	TRUNCATE TABLE Employees;

-- 10.Remove Employee table. (Use Drop) 

	DROP TABLE Employees;

-- 11.Delete all the records of DEPOSIT table. (Use Truncate)

	TRUNCATE TABLE DEPOSIT;

-- 12.Remove DEPOSIT table. (Use Drop)

	--DROP TABLE DEPOSIT;

-- 13.Remove BRANCH table. (Use Drop)

	--DROP TABLE BRANCH;

-- 14.Remove CUSTOMERS table. (Use Drop) 

	--DROP TABLE CUSTOMERS;

-- 15.Remove BORROW table. (Use Drop) 

	--DROP TABLE BORROW;