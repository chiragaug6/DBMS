CREATE TABLE COMPANY (
    Title VARCHAR(100),
    Company VARCHAR(100),
    Type VARCHAR(50),
    Production_year INT,
    System VARCHAR(50),
    Production_cost DECIMAL(18, 2),
    Revenue DECIMAL(18, 2),
    Rating INT
);

INSERT INTO COMPANY (Title, Company, Type, Production_year, System, Production_cost, Revenue, Rating) VALUES
('Blasting Boxes', 'Simone Games', 'action adventure', 1998, 'PC', 100000, 200000, 7),
('Run Run Run!', '13 Mad Bits', 'shooter', 2011, 'PS3', 3500000, 650000, 3),
('Duck n''Go', '13 Mad Bits', 'shooter', 2012, 'Xbox', 3000000, 1500000, 5),
('SQL Wars!', 'Vertabelo', 'wargames', 2017, 'Xbox', 5000000, 25000000, 10),
('Tap Tap Hex!', 'PixelGaming Inc.', 'rhythm', 2006, 'PS2', 2500000, 3500000, 7),
('NoRisk', 'Simone Games', 'action adventure', 2004, 'PS2', 1400000, 3400000, 8);

--1. Display the name and total revenue for each company.  

SELECT 
    Company,
    SUM(Revenue) AS Total_Revenue
FROM 
    COMPANY
GROUP BY 
    Company;

/**
2. Generate a report with the production year and the number of games released this year (named count), the 
average of production cost for all games produced in this year (named avg_cost) and the average revenue 
for that year (named avg_revenue). 
**/

SELECT 
    Production_year,
    COUNT(*) AS Count,
    AVG(Production_cost) AS Avg_Cost,
    AVG(Revenue) AS Avg_Revenue
FROM 
    COMPANY
GROUP BY 
    Production_year;

/**
3. Count how many games of a given type are profitable (i.e. the revenue was greater than the production 
cost). Show the game type and the number of profitable games (named number_of_games) for each type. 
**/

SELECT 
    Type,
    COUNT(*) AS Number_of_Games
FROM 
    COMPANY
WHERE 
    Revenue > Production_cost
GROUP BY 
    Type;

/**
4. Obtain the type of games and the total revenue generated for games with a production_year after 2010 and 
with a PS2 or PS3 system. Order the result so the types with the highest revenue come first. 
**/

SELECT 
    Type,
    SUM(Revenue) AS Total_Revenue
FROM 
    COMPANY
WHERE 
    Production_year > 2010
    AND System IN ('PS2', 'PS3')
GROUP BY 
    Type
ORDER BY 
    Total_Revenue DESC;

/**
5. For all companies present in the table, obtain their names and the sum of gross profit over all years. (Assume 
that gross profit = revenue - cost of production). Name this column gross_profit_sum. Order the results by 
gross profit, in descending order.
**/

SELECT 
    Company,
    SUM(Revenue - Production_cost) AS Gross_Profit_Sum
FROM 
    COMPANY
GROUP BY 
    Company
ORDER BY 
    Gross_Profit_Sum DESC;

/**
6. Obtain the yearly gross profit of each company. In other words, we want a report with the company name, 
the year, and the gross profit for that year. Order the report by company name and year. 
**/

SELECT 
    Company,
    Production_year,
    SUM(Revenue - Production_cost) AS Yearly_Gross_Profit
FROM 
    COMPANY
GROUP BY 
    Company, Production_year
ORDER BY 
    Company, Production_year;

/**
7. For each company, select its name, the number of games it’s produced (as the number_of_games column), 
and the average cost of production (as the avg_cost column). Show only companies producing more than 
one game.
**/

SELECT 
    Company,
    COUNT(*) AS Number_of_Games,
    AVG(Production_cost) AS Avg_Cost
FROM 
    COMPANY
GROUP BY 
    Company
HAVING 
    COUNT(*) > 1;
