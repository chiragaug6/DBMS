-- 1. Write a SQL statement to generate a report with customer name, city, order number, order date, order amount, 
-- salesperson name, and commission to determine if any of the existing customers have not placed orders or 
-- if they have placed orders through their salesman or by themselves.

SELECT c.cust_name AS Customer, c.city AS City, o.ord_no AS Order_Number, o.ord_date AS Order_Date, o.purch_amt AS Order_Amount, s.name AS Salesman, s.commission
FROM CUSTOMER c
LEFT JOIN ORDERS o ON c.customer_id = o.customer_id
LEFT JOIN SALESMAN s ON c.salesman_id = s.salesman_id;

-- 2. Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers 
-- or have not yet joined any of the customers.

SELECT s.name AS Salesman, c.cust_name AS Customer
FROM SALESMAN s
LEFT JOIN CUSTOMER c ON s.salesman_id = c.salesman_id
ORDER BY s.name ASC;

-- 3. Write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.

SELECT s.name AS Salesman, c.cust_name AS Customer, c.city AS City, c.grade AS Grade, o.ord_no AS Order_Number, o.ord_date AS Order_Date, o.purch_amt AS Order_Amount
FROM SALESMAN s
LEFT JOIN CUSTOMER c ON s.salesman_id = c.salesman_id
LEFT JOIN ORDERS o ON c.customer_id = o.customer_id;


-- 4. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. 
-- The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.

SELECT s.name AS Salesman, c.cust_name AS Customer, c.city AS City, c.grade AS Grade, o.ord_no AS Order_Number, o.ord_date AS Order_Date, o.purch_amt AS Order_Amount
FROM SALESMAN s
LEFT JOIN CUSTOMER c ON s.salesman_id = c.salesman_id
LEFT JOIN ORDERS o ON c.customer_id = o.customer_id
WHERE (o.purch_amt >= 2000 AND c.grade IS NOT NULL) OR o.ord_no IS NULL;

-- 5. For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, 
-- create a report containing the customer name, city, order number, order date, and purchase amount.

SELECT c.cust_name AS Customer, c.city AS City, o.ord_no AS Order_Number, o.ord_date AS Order_Date, o.purch_amt AS Order_Amount
FROM ORDERS o
LEFT JOIN CUSTOMER c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NOT NULL OR o.customer_id IS NULL;

-- 6. Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list 
-- who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.

SELECT c.cust_name AS Customer, c.city AS City, o.ord_no AS Order_Number, o.ord_date AS Order_Date, o.purch_amt AS Order_Amount
FROM ORDERS o
LEFT JOIN CUSTOMER c ON o.customer_id = c.customer_id
WHERE (c.grade IS NOT NULL AND o.ord_no IS NOT NULL) OR (c.customer_id IS NULL AND c.grade IS NULL);

-- 7. Write a SQL query to combine each row of the salesman table with each row of the customer table.

SELECT s.name AS Salesman, c.cust_name AS Customer, c.city AS City, c.grade AS Grade
FROM SALESMAN s
CROSS JOIN CUSTOMER c;

-- 8. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers 
-- and vice versa for that salesperson who belongs to that city.

SELECT s.name AS Salesman, c.cust_name AS Customer, c.city AS Customer_City, s.city AS Salesman_City
FROM SALESMAN s
CROSS JOIN CUSTOMER c
WHERE s.city = c.city;

-- 9. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer 
-- and vice versa for those salesmen who belong to a city and customers who require a grade.

SELECT s.name AS Salesman, c.cust_name AS Customer, c.city AS Customer_City, c.grade AS Grade
FROM SALESMAN s
CROSS JOIN CUSTOMER c
WHERE c.grade IS NOT NULL AND s.city = c.city;

-- 10. Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers 
-- and vice versa for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade.

SELECT s.name AS Salesman, c.cust_name AS Customer, c.city AS Customer_City, c.grade AS Grade
FROM SALESMAN s
CROSS JOIN CUSTOMER c
WHERE s.city <> c.city AND c.grade IS NOT NULL;
