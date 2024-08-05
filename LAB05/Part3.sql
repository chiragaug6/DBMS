-- 1. Calculate the Average Product Price

SELECT AVG(price) AS average_product_price
FROM PRODUCTS;

-- 2. Count the Number of Products with Price Higher Than or Equal to 350

SELECT COUNT(*) AS number_of_products
FROM PRODUCTS
WHERE price >= 350;

-- 3. Compute the Average Price for Unique Companies

SELECT company_id, AVG(price) AS average_price
FROM PRODUCTS
GROUP BY company_id;

-- 4. Compute the Sum of the Allotment Amount of All Departments

SELECT SUM(allotment_amount) AS total_allotment_amount
FROM DEPARTMENTS;

-- 5. Count the Number of Employees in Each Department

SELECT department_code, COUNT(*) AS number_of_employees
FROM EMPLOYEES
GROUP BY department_code;

