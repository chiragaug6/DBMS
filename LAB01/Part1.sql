--1. Retrieve all data from table DEPOSIT
SELECT * FROM DEPOSIT;

--2. Retrieve all data from table BORROW
SELECT * FROM BORROW;

--3. Retrieve all data from table CUSTOMERS
SELECT * FROM CUSTOMERS;

--4. Insert a record (550, 'JAY', 'AJNI', NULL) in the BORROW table
INSERT INTO BORROW (LOANNO, CNAME, BNAME, AMOUNT) VALUES
(550, 'JAY', 'AJNI', NULL);

--5. Display Account No, Customer Name & Amount from DEPOSIT
SELECT ACTNO, CNAME, AMOUNT FROM DEPOSIT;

--6. Display Loan No, Amount from BORROW
SELECT LOANNO, AMOUNT FROM BORROW;

--7. Display loan details of all customers who belong to the ‘ANDHERI’ branch
SELECT b.LOANNO, b.CNAME, b.BNAME, b.AMOUNT
FROM BORROW b JOIN DEPOSIT d ON b.CNAME = d.CNAME
WHERE d.BNAME = 'ANDHERI';

--8. Give account no and amount of depositor whose account no equals 106
SELECT ACTNO, AMOUNT FROM DEPOSIT WHERE ACTNO = 106;

--9. Give names of borrowers having an amount greater than 5000
SELECT DISTINCT CNAME FROM BORROW WHERE AMOUNT > 5000;

--10. Give names of customers who opened an account after the date 1-12-96
SELECT CNAME FROM DEPOSIT WHERE ADATE > '1995-12-01';

--11. Display names of customers whose account no is less than 105
SELECT CNAME FROM DEPOSIT WHERE ACTNO < 105;

--12. Display names of customers who belong to either ‘NAGPUR’ or ‘DELHI’
SELECT CNAME FROM CUSTOMERS WHERE CITY IN ('NAGPUR', 'DELHI');

--13. Display names of customers with branches whose amount is greater than 4000 and account no is less than 105
SELECT DISTINCT d.CNAME 
FROM DEPOSIT d
JOIN BRANCH b ON d.BNAME = b.BNAME
WHERE d.AMOUNT > 4000 AND d.ACTNO < 105;

--14. Find all borrowers whose amount is greater than or equal to 3000 and less than or equal to 8000
SELECT * FROM BORROW WHERE AMOUNT BETWEEN 3000 AND 8000;

--15. Find all depositors who do not belong to the ‘ANDHERI’ branch
SELECT DISTINCT d.CNAME FROM DEPOSIT d WHERE d.BNAME <> 'ANDHERI';

--16. Display Account No, Customer Name & Amount of such customers who belong to ‘AJNI’, ‘KAROLBAGH’ or ‘M.G. ROAD’ and Account No is less than 104
SELECT ACTNO, CNAME, AMOUNT FROM DEPOSIT
WHERE BNAME IN ('AJNI', 'KAROLBAGH', 'M.G. ROAD') AND ACTNO < 104;

--17. Display all the details of the first five customers
SELECT TOP 5 * FROM CUSTOMERS;

--18. Display all the details of the first three depositors whose amount is greater than 1000
SELECT TOP 3 * FROM DEPOSIT WHERE AMOUNT > 1000;

--19. Display Loan No, Customer Name of the first five borrowers whose branch name does not belong to ‘ANDHERI`
SELECT TOP 5 LOANNO, CNAME FROM BORROW WHERE BNAME <> 'ANDHERI';

--20. Retrieve all unique cities using DISTINCT (Use CUSTOMERS Table)
SELECT DISTINCT CITY FROM CUSTOMERS;

--21. Retrieve all unique branches using DISTINCT (Use BRANCH Table)
SELECT DISTINCT BNAME FROM BRANCH;

--22. Retrieve all the records of the CUSTOMERS table as per their city name in ascending order
SELECT * FROM CUSTOMERS ORDER BY CITY ASC;

--23. Retrieve all the records of the DEPOSIT table as per their amount column in descending order
SELECT * FROM DEPOSIT ORDER BY AMOUNT DESC;

--24. Update deposit amount of all customers from 3000 to 5000
UPDATE DEPOSIT SET AMOUNT = 5000 WHERE AMOUNT = 3000;

--25. Change branch name of ANIL from VRCE to C.G. ROAD (Use BORROW Table)
UPDATE DEPOSIT SET BNAME = 'C.G. ROAD' WHERE CNAME = 'ANIL' AND BNAME = 'VRCE';

UPDATE BORROW SET BNAME = 'C.G. ROAD' WHERE CNAME = 'ANIL' AND BNAME = 'VRCE';

--26. Update Account No of SANDIP to 111 & Amount to 5000
UPDATE DEPOSIT SET ACTNO = 111, AMOUNT = 5000 WHERE CNAME = 'SANDIP';

--27. Give 10% Increment in Loan Amount
UPDATE BORROW SET AMOUNT = AMOUNT * 1.10;

--28. Update deposit amount of all depositors to 5000 whose account no is between 103 & 107
UPDATE DEPOSIT SET AMOUNT = 5000 WHERE ACTNO BETWEEN 103 AND 107;

--29. Update amount of loan no 321 to NULL
UPDATE BORROW SET AMOUNT = NULL WHERE LOANNO = 321;

--30. Display the name of borrowers whose amount is NULL
SELECT CNAME FROM BORROW WHERE AMOUNT IS NULL;






