CREATE TABLE Country (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL
);

CREATE TABLE State (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(100) NOT NULL,
    Cid INT,
    FOREIGN KEY (Cid) REFERENCES Country(Cid)
);

CREATE TABLE District (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL,
    Sid INT,
    FOREIGN KEY (Sid) REFERENCES State(Sid)
);

CREATE TABLE City (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL,
    Did INT,
    FOREIGN KEY (Did) REFERENCES District(Did)
);

CREATE TABLE Dept (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL
);

CREATE TABLE Emp (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10, 2) CHECK (Salary >= 0),  -- Salary cannot be negative
    Experience DECIMAL(3, 1) CHECK (Experience >= 0 AND Experience <= 50),  -- Experience should be between 0 and 50 years
    FOREIGN KEY (Did) REFERENCES Dept(Did),   -- Foreign key to Dept table
    FOREIGN KEY (Cid) REFERENCES City(Cid)    -- Foreign key to City table
);

-- This should fail because the Did value does not exist in the District table
INSERT INTO City (Cid, Cname, Did) VALUES
(1, 'Some City', 999);  -- 999 is a non-existent Did in District table

-- This should fail because Experience cannot be greater than 50
INSERT INTO Emp (Eid, Ename, Did, Cid, Salary, Experience) VALUES
(1, 'John Doe', 1, 1, 50000.00, 55);

--Step 1: Insert 5 Records into Each Table

INSERT INTO Country (Cid, Cname) VALUES
(1, 'India'),
(2, 'USA'),
(3, 'Canada'),
(4, 'Australia'),
(5, 'Germany');

INSERT INTO State (Sid, Sname, Cid) VALUES
(1, 'Gujarat', 1),
(2, 'Maharashtra', 1),
(3, 'California', 2),
(4, 'Ontario', 3),
(5, 'Bavaria', 5);

INSERT INTO District (Did, Dname, Sid) VALUES
(1, 'Ahmedabad', 1),
(2, 'Pune', 2),
(3, 'Los Angeles', 3),
(4, 'Toronto', 4),
(5, 'Munich', 5);

INSERT INTO City (Cid, Cname, Did) VALUES
(1, 'Ahmedabad', 1),
(2, 'Pune', 2),
(3, 'Los Angeles', 3),
(4, 'Toronto', 4),
(5, 'Munich', 5);

INSERT INTO Dept (Did, Dname) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'Sales'),
(4, 'HR'),
(5, 'Finance');

INSERT INTO Emp (Eid, Ename, Did, Cid, Salary, Experience) VALUES
(1, 'Ravi Patel', 1, 1, 60000.00, 5),
(2, 'Amit Shah', 2, 2, 55000.00, 3),
(3, 'John Doe', 3, 3, 70000.00, 8),
(4, 'Jane Smith', 4, 4, 50000.00, 6),
(5, 'Laura M�ller', 5, 5, 80000.00, 10);

--Step 2: Display Employee Details Along with Department, City, District, State, and Country
SELECT 
    E.Ename AS EmployeeName,
    D.Dname AS DepartmentName,
    E.Salary,
    E.Experience,
    C.Cname AS CityName,
    Dt.Dname AS DistrictName,
    S.Sname AS StateName,
    Cn.Cname AS CountryName
FROM 
    Emp E
JOIN 
    Dept D ON E.Did = D.Did
JOIN 
    City C ON E.Cid = C.Cid
JOIN 
    District Dt ON C.Did = Dt.Did
JOIN 
    State S ON Dt.Sid = S.Sid
JOIN 
    Country Cn ON S.Cid = Cn.Cid;

 