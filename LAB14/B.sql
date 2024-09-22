--Part – B:
--1. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases the
--price by 10%.

DECLARE Product_CursorUpdate CURSOR FOR
SELECT Product_id, Price FROM Products;

-- Declare variables to hold the fetched data
DECLARE @Product_id INT;
DECLARE @Price DECIMAL(10, 2);

-- Open the cursor
OPEN Product_CursorUpdate;

-- Fetch the first row from the cursor
FETCH NEXT FROM Product_CursorUpdate INTO @Product_id, @Price;

-- Loop through the fetched rows
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Update the Price by increasing it by 10%
    UPDATE Products
    SET Price = @Price * 1.10
    WHERE Product_id = @Product_id;

    PRINT 'Updated Product ID: ' + CAST(@Product_id AS VARCHAR(10)) + 
          ' with New Price: ' + CAST(@Price * 1.10 AS VARCHAR(10));

    -- Fetch the next row from the cursor
    FETCH NEXT FROM Product_CursorUpdate INTO @Product_id, @Price;
END;

-- Close and deallocate the cursor
CLOSE Product_CursorUpdate;
DEALLOCATE Product_CursorUpdate;
