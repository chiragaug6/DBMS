-- Creating the CITY table
CREATE TABLE CITY (
    CityID INT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE NOT NULL,
    Pincode INT NOT NULL,
    Remarks VARCHAR(255)
);

-- Inserting the data
INSERT INTO CITY (CityID, Name, Pincode, Remarks) VALUES
(1, 'Rajkot', 360005, 'Good'),
(2, 'Surat', 335009, 'Very Good'),
(3, 'Baroda', 390001, 'Awesome'),
(4, 'Jamnagar', 361003, 'Smart'),
(5, 'Junagadh', 362229, 'Historic'),
(6, 'Morvi', 363641, 'Ceramic');

-- Creating the VILLAGE table
CREATE TABLE VILLAGE (
    VID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES CITY(CityID)
);

-- Inserting the data
INSERT INTO VILLAGE (VID, Name, CityID) VALUES
(101, 'Raiya', 1),
(102, 'Madhapar', 1),
(103, 'Dodka', 3),
(104, 'Falla', 4),
(105, 'Bhesan', 5),
(106, 'Dhoraji', 5);


--1. Display all the villages of Rajkot city.

SELECT V.Name AS VillageName
FROM VILLAGE V
JOIN CITY C ON V.CityID = C.CityID
WHERE C.Name = 'Rajkot';

--2. Display city along with their villages & pin code.

SELECT C.Name AS CityName, C.Pincode, V.Name AS VillageName
FROM CITY C
LEFT JOIN VILLAGE V ON C.CityID = V.CityID

--3. Display the city having more than one village.

SELECT C.Name AS CityName
FROM CITY C
JOIN VILLAGE V ON C.CityID = V.CityID
GROUP BY C.Name
HAVING COUNT(V.VID) > 1;

--4. Display the city having no village.

SELECT C.Name AS CityName,*
FROM CITY C
LEFT JOIN VILLAGE V ON C.CityID = V.CityID
WHERE V.VID IS NULL;

--5. Count the total number of villages in each city.

SELECT C.Name AS CityName, COUNT(V.VID) AS VillageCount
FROM CITY C
LEFT JOIN VILLAGE V ON C.CityID = V.CityID
GROUP BY C.Name;

--6. Count the number of cities having more than one village.

SELECT COUNT(DISTINCT C.CityID) AS CitiesWithMoreThanOneVillage
FROM CITY C
JOIN VILLAGE V ON C.CityID = V.CityID
GROUP BY C.CityID
HAVING COUNT(V.VID) > 1;

-- Creating the STUDENT table with the specified constraints
CREATE TABLE STUDENT (
    Rno INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Branch VARCHAR(50) DEFAULT 'General',
    SPI DECIMAL(4, 2) CHECK (SPI >= 0 AND SPI <= 10),
    Bklog INT CHECK (Bklog >= 0)
);

-- Inserting the data
INSERT INTO STUDENT (Rno, Name, Branch, SPI, Bklog) VALUES
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 0),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh', DEFAULT, 4.50, 3);

SELECT * FROM STUDENT;

UPDATE STUDENT
SET SPI = 12
WHERE Name = 'Raju';

UPDATE STUDENT
SET Bklog = -1
WHERE Name = 'Neha';



