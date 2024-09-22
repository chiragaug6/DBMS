--Step 1: Create the NewProducts Table

CREATE TABLE NewProducts (
    Product_id INT PRIMARY KEY,
    Product_Name VARCHAR(250) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

--Step 2: Create the Cursor to Insert "Laptop" Details into NewProducts

DECLARE Product_CursorLaptop CURSOR FOR
SELECT Product_id, Product_Name, Price FROM Products WHERE Product_Name = 'Laptop';

-- Declare variables to hold the fetched data
DECLARE @Product_id INT;
DECLARE @Product_Name VARCHAR(250);
DECLARE @Price DECIMAL(10,2);

-- Open the cursor
OPEN Product_CursorLaptop;

-- Fetch the first row from the cursor
FETCH NEXT FROM Product_CursorLaptop INTO @Product_id, @Product_Name, @Price;

-- Loop through the fetched rows
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Insert the product details into the NewProducts table
    INSERT INTO NewProducts (Product_id, Product_Name, Price)
    VALUES (@Product_id, @Product_Name, @Price);

    PRINT 'Inserted into NewProducts: ' + CAST(@Product_id AS VARCHAR(10)) + 
          ' - ' + @Product_Name + 
          ' at Price: ' + CAST(@Price AS VARCHAR(10));

    -- Fetch the next row from the cursor
    FETCH NEXT FROM Product_CursorLaptop INTO @Product_id, @Product_Name, @Price;
END;

-- Close and deallocate the cursor
CLOSE Product_CursorLaptop;
DEALLOCATE Product_CursorLaptop;


