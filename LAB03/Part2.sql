CREATE TABLE CUSTOMER (
    CID INT,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);

INSERT INTO CUSTOMER (CID, CustomerName, ContactName, Address, City, PostalCode, Country) VALUES
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitucion 2222', 'Mexico D.F.', '05021', 'Mexico'),
(3, 'Antonio Moreno Taqueria', 'Antonio Moreno', 'Mataderos 2312', 'Mexico D.F.', '05023', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 'Berglunds snabbkop', 'Christina Berglund', 'Berguvsvagen 8', 'Lulea', 'S-958 22', 'Sweden');

SELECT * FROM CUSTOMER

--1. Return all customers from a city that starts with 'L' followed by one wildcard character, then 'nd' and then two wildcard characters.

SELECT * FROM CUSTOMER  WHERE City LIKE 'L%nd__%';

--2. Return all customers from a city that contains the letter 'L'

SELECT * FROM CUSTOMER WHERE City LIKE '%L%';

--3. Return all customers from a city that does not contain the letter 'L'

SELECT * FROM CUSTOMER WHERE City NOT LIKE '%L%';

--4. Return all customers that starts with 'La'

SELECT * FROM CUSTOMER WHERE CustomerName LIKE 'La%';

--5. Return all customers that do not starts with 'La'

SELECT * FROM CUSTOMER WHERE CustomerName NOT LIKE 'La%';

--6. Return all customers that starts with 'a' or starts with 'b'. 

SELECT * FROM CUSTOMER WHERE CustomerName LIKE 'a%' OR CustomerName LIKE 'b%';

--7. Return all customers that starts with 'a' or starts with 'c' or starts with ’t’. 

SELECT * FROM CUSTOMER WHERE CustomerName LIKE 'a%' OR CustomerName LIKE 'c%' OR CustomerName LIKE 't%';

--8. Return all customers that starts with 'a' to ’d’. 

SELECT * FROM CUSTOMER WHERE CustomerName LIKE '[a-d]%';

--9. Return all customers that ends with 'a'. 

SELECT * FROM CUSTOMER WHERE CustomerName LIKE '%a';

--10. Return all customers that do not ends with 'a'. 

SELECT * FROM CUSTOMER WHERE CustomerName NOT LIKE '%a';

--11. Return all customers that starts with 'b' and ends with ’s’. 

SELECT * FROM CUSTOMER WHERE CustomerName LIKE 'b%s';

--12. Return all customers that contains the phrase 'or'. 

SELECT * FROM CUSTOMER WHERE CustomerName LIKE '%or%';

--13. Return all customers that starts with "a" and are at least 3 characters in length.

SELECT * FROM CUSTOMER WHERE CustomerName LIKE 'a__%';

--14. Return all customers that have "r" in the second position. 

SELECT * FROM CUSTOMER WHERE CustomerName LIKE '_r%';

--15. Return all customers from Spain. 

SELECT * FROM CUSTOMER WHERE Country = 'Spain';




