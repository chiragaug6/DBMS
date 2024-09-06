--Part - B: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 
--1. Emp(Eid, Ename, Did, Cid, Salary, Experience) 
--Dept(Did, Dname) 
--City(Cid, Cname) 

-- Creating the Dept table
CREATE TABLE Dept (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL
);

-- Creating the City table
CREATE TABLE City2 (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL
);

-- Creating the Emp table with proper validations
CREATE TABLE Emp (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10, 2) CHECK (Salary >= 0),
    Experience DECIMAL(3, 1) CHECK (Experience >= 0 AND Experience <= 50),
    FOREIGN KEY (Did) REFERENCES Dept(Did),
    FOREIGN KEY (Cid) REFERENCES City2(Cid)
);


-- Inserting data that violates the constraints
-- This should fail due to the negative salary
INSERT INTO Emp (Eid, Ename, Did, Cid, Salary, Experience) VALUES
(1, 'John Doe', 1, 1, -5000.00, 5);

-- This should fail due to the experience being greater than 50
INSERT INTO Emp (Eid, Ename, Did, Cid, Salary, Experience) VALUES
(2, 'Jane Smith', 2, 2, 50000.00, 55);

