/** 1. Display the Cname whose Bname is either AJNI or CHANDI and amount is greater than 3000 and sort the 
result in ascending order by their amount and if amount is same then in descending order by cname. **/

	SELECT CNAME FROM ACCOUNT WHERE BNAME IN ('AJNI', 'CHANDI') AND AMOUNT > 3000 ORDER BY AMOUNT ASC, CNAME DESC;

-- 2. Retrieve top 3 unique BNAME and sort them in ascending order on BNAME.

	SELECT TOP 3 BNAME FROM (SELECT DISTINCT BNAME FROM ACCOUNT) AS UniqueBnames ORDER BY BNAME ASC;

/** 3. Display the Cname whose ACTNO is greater than 103 and sort the result in ascending order by their amount 
and if amount is same then in descending order by cname. **/

	SELECT CNAME FROM ACCOUNT WHERE ACTNO > 103 ORDER BY AMOUNT ASC, CNAME DESC;

-- 4. Update the BNAME of Anil, Mehul and Shivani to NULL. 

	UPDATE ACCOUNT SET BNAME = NULL WHERE CNAME IN ('ANIL', 'MEHUL', 'SHIVANI');

-- 5. Display the Cname of customers whose Bname is NULL. 

	SELECT CNAME FROM ACCOUNT WHERE BNAME IS NULL;

-- 6. Update the amount of Anil to 5000.

	UPDATE ACCOUNT SET AMOUNT = 5000 WHERE CNAME = 'ANIL';

-- 7. Update amount of actno 109 to NULL. 

	UPDATE ACCOUNT SET AMOUNT = NULL WHERE ACTNO = 109;

-- 8. Retrieve all the records of account table as per their bname in descending order. 

	SELECT * FROM ACCOUNT ORDER BY BNAME DESC;

-- 9. Delete all the records of Account table. (Use Truncate) 

	TRUNCATE TABLE Transactions;

-- 10. Remove Account table. (Use Drop) 

	DROP TABLE Transactions;
