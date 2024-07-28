CREATE TABLE Employees (
    EmpNo INT PRIMARY KEY,
    EmpName VARCHAR(100),
    JoiningDate DATE,
    Salary DECIMAL(10, 2),
    City VARCHAR(50)
);

INSERT INTO Employees (EmpNo, EmpName, JoiningDate, Salary, City) VALUES
(101, 'Keyur', '2002-05-01', 12000.00, 'Rajkot'),
(102, 'Hardik', '2004-02-15', 14000.00, 'Ahmedabad'),
(103, 'Kajal', '2006-03-14', 15000.00, 'Baroda'),
(104, 'Bhoomi', '2005-06-23', 12500.00, 'Ahmedabad'),
(105, 'Harmit', '2004-02-15', 14000.00, 'Rajkot');

SELECT * FROM Employees;