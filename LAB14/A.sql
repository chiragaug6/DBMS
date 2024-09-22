create database LAB14;

use LAB14;

CREATE TABLE Products (
    Product_id INT PRIMARY KEY,
    Product_Name VARCHAR(250) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

INSERT INTO Products (Product_id, Product_Name, Price)
VALUES 
(1, 'Smartphone', 35000.00),
(2, 'Laptop', 65000.00),
(3, 'Headphones', 5500.00),
(4, 'Television', 85000.00),
(5, 'Gaming Console', 32000.00);

--1. Create a cursor Product_Cursor to fetch all the rows from a products table

DECLARE Product_Cursor CURSOR FOR
SELECT Product_id, Product_Name, Price FROM Products;

-- Declare variables to hold the fetched data
DECLARE @Product_id INT, @Product_Name VARCHAR(250), @Price DECIMAL(10,2);

-- Open the cursor
OPEN Product_Cursor;

-- Fetch each row from the cursor
FETCH NEXT FROM Product_Cursor INTO @Product_id, @Product_Name, @Price;

-- Loop through the fetched rows
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Product ID: ' + CAST(@Product_id AS VARCHAR(10)) + 
          ', Product Name: ' + @Product_Name + 
          ', Price: ' + CAST(@Price AS VARCHAR(10));
          
    FETCH NEXT FROM Product_Cursor INTO @Product_id, @Product_Name, @Price;
END;

-- Close and deallocate the cursor
CLOSE Product_Cursor;
DEALLOCATE Product_Cursor;


--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName.

DECLARE Product_Cursor_Fetch CURSOR FOR
SELECT Product_id, Product_Name FROM Products;

-- Declare variables to hold the fetched data
DECLARE @Product_id INT, @Product_Name VARCHAR(250);

-- Open the cursor
OPEN Product_Cursor_Fetch;

-- Fetch each row from the cursor
FETCH NEXT FROM Product_Cursor_Fetch INTO @Product_id, @Product_Name;

-- Loop through the fetched rows
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT CAST(@Product_id AS VARCHAR(10)) + '_' + @Product_Name;

    FETCH NEXT FROM Product_Cursor_Fetch INTO @Product_id, @Product_Name;
END;

-- Close and deallocate the cursor
CLOSE Product_Cursor_Fetch;
DEALLOCATE Product_Cursor_Fetch;

--3. Create a cursor Product_CursorDelete that deletes all the data from the Products table

DECLARE Product_CursorDelete CURSOR FOR
SELECT Product_id FROM Products;

-- Declare a variable to hold the fetched Product_id
DECLARE @Product_id INT;

-- Open the cursor
OPEN Product_CursorDelete;

-- Fetch each Product_id from the cursor
FETCH NEXT FROM Product_CursorDelete INTO @Product_id;

-- Loop through the fetched rows
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Delete each product by Product_id
    DELETE FROM Products WHERE Product_id = @Product_id;

    PRINT 'Deleted Product ID: ' + CAST(@Product_id AS VARCHAR(10));

    FETCH NEXT FROM Product_CursorDelete INTO @Product_id;
END;

-- Close and deallocate the cursor
CLOSE Product_CursorDelete;
DEALLOCATE Product_CursorDelete;

