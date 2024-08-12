-- 1. Write a SQL query to select all rows from both participating tables as long as there is a match between pro_com and com_id.

SELECT *
FROM products p
JOIN companies c ON p.pro_com = c.com_id;

-- 2. Write a SQL query to display the item name, price, and company name of all the products.

SELECT p.item_name AS Item_Name, p.price AS Price, c.company_name AS Company_Name
FROM products p
JOIN companies c ON p.pro_com = c.com_id;

-- 3. Write a SQL query to calculate the average price of items of each company. Return average value and company name.

SELECT c.company_name AS Company_Name, AVG(p.price) AS Average_Price
FROM products p
JOIN companies c ON p.pro_com = c.com_id
GROUP BY c.company_name;

-- 4. Write a SQL query to calculate and find the average price of items of each company higher than or equal to Rs. 350. Return average value and company name.

SELECT c.company_name AS Company_Name, AVG(p.price) AS Average_Price
FROM products p
JOIN companies c ON p.pro_com = c.com_id
WHERE p.price >= 350
GROUP BY c.company_name;

-- 5. Write a SQL query to find the most expensive product of each company. Return pro_name, pro_price and com_name.

SELECT p.pro_name AS Product_Name, p.pro_price AS Price, c.com_name AS Company_Name
FROM products p
JOIN companies c ON p.pro_com = c.com_id
WHERE p.pro_price = (
    SELECT MAX(p2.pro_price)
    FROM products p2
    WHERE p2.pro_com = p.pro_com
);

-- 6. Write a SQL query to display all the data of employees including their department.

SELECT e.*, d.*
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

-- 7. Write a SQL query to display the first and last names of each employee, as well as the department name and sanction amount.

SELECT e.first_name AS First_Name, e.last_name AS Last_Name, d.dept_name AS Department_Name, d.sanction_amount AS Sanction_Amount
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

-- 8. Write a SQL query to find the departments with budgets more than Rs. 50000 and display the first name and last name of employees.

SELECT e.first_name AS First_Name, e.last_name AS Last_Name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE d.budget > 50000;

-- 9. Write a SQL query to find the names of departments where more than two employees are employed. Return dpt_name.

SELECT d.dept_name AS Department_Name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.employee_id) > 2;


