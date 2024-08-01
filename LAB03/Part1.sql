CREATE TABLE STUDENT (
    StuID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Website VARCHAR(100),
    City VARCHAR(50),
    Division VARCHAR(50)
);

INSERT INTO STUDENT (StuID, FirstName, LastName, Website, City, Division) VALUES
(1011, 'Keyur', 'Patel', 'techonthenet.com', 'Rajkot', 'II-BCX'),
(1022, 'Hardik', 'Shah', 'digminecraft.com', 'Ahmedabad', 'I-BCY'),
(1033, 'Kajal', 'Trivedi', 'bigactivities.com', 'Baroda', 'IV-DCX'),
(1044, 'Bhoomi', 'Gajera', 'checkyourmath.com', 'Ahmedabad', 'III-DCW'),
(1055, 'Harmit', 'Mitel', NULL, 'Rajkot', 'II-BCY'),
(1066, 'Ashok', 'Jani', NULL, 'Baroda', 'II-BCZ');

SELECT * FROM STUDENT

--1. Display the Name of Students Whose Name Starts with 'K'

SELECT FirstName, LastName FROM STUDENT WHERE FirstName LIKE 'K%';

--2. Display the Name of Students Whose Name Consists of Five Characters

SELECT FirstName, LastName FROM STUDENT WHERE LEN(FirstName) = 5 OR FIRSTNAME LIKE '_____';

--3. Retrieve the First Name & Last Name of Students Whose City Name Ends with 'a' & Contains Six Characters

SELECT FirstName, LastName,City FROM STUDENT WHERE CITY LIKE '_____a'

--4. Display All the Students Whose Last Name Ends with 'tel'

SELECT * FROM STUDENT WHERE LastName LIKE '%tel';

--5. Display All the Students Whose First Name Starts with ‘ha’ & Ends with ‘t’

SELECT * FROM STUDENT WHERE FirstName LIKE 'HA%T'

--6. Display All the Students Whose First Name Starts with ‘k’ and the Third Character is ‘y’

SELECT * FROM STUDENT WHERE FirstName LIKE 'K_Y%'

--7. Display the Name of Students Having No Website and Name Consists of Five Characters

SELECT * FROM STUDENT WHERE Website IS NULL AND FirstName LIKE '_____';

--8. Display All the Students Whose Last Name Consists of ‘jer’

SELECT * FROM STUDENT WHERE LastName LIKE '%JER%'

--9. Display All the Students Whose City Name Starts with Either ‘r’ or ‘b’

SELECT * FROM STUDENT WHERE CITY LIKE 'R%' or CITY LIKE 'B%';

SELECT FirstName, LastName FROM STUDENT WHERE City LIKE '[rb]%';

--10. Display All the Students Having Websites

SELECT * FROM STUDENT WHERE Website IS NOT NULL;

--11. Display All the Students Whose Name Starts from Alphabet A to H

SELECT * FROM STUDENT WHERE FirstName LIKE '[A-H]%'

--12. Display All the Students Whose Name’s Second Character is a Vowel

SELECT * FROM STUDENT WHERE FirstName LIKE '_[AEIOU]%'

--13. Display Student’s Name Whose City Name Consists of ‘rod’

SELECT * FROM STUDENT WHERE CITY LIKE '%ROD%'

--14. Retrieve the First & Last Name of Students Whose Website Name Starts with ‘bi’

SELECT * FROM STUDENT WHERE Website LIKE 'bi%';

--15. Display Student’s City Whose Last Name Consists of Six Characters

SELECT * FROM STUDENT WHERE LastName LIKE '______'

--16. Display All the Students Whose City Name Consists of Five Characters & Does Not Start with ‘ba'

SELECT * FROM STUDENT WHERE LEN(City) = 5 AND City NOT LIKE 'ba%';

--17. Show All the Students Whose Division Starts with ‘II’

SELECT * FROM STUDENT WHERE Division LIKE 'II%'

--18. Find Out Student’s First Name Whose Division Contains ‘bc’ Anywhere in Division Name

SELECT * FROM STUDENT WHERE Division LIKE '%bc%';

--19. Show Student ID and City Name in Which Division Consists of Six Characters and Has a Website

SELECT StuID, City FROM STUDENT WHERE LEN(Division) = 6 AND Website IS NOT NULL;

--20. Display All the Students Whose Name’s Third Character is a Consonant

SELECT * FROM STUDENT WHERE SUBSTRING(FirstName, 3, 1) NOT LIKE '[aeiouAEIOU]';  
--SUBSTRING(expression, start, length)

SELECT * FROM STUDENT WHERE FirstName LIKE '__[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]%';
