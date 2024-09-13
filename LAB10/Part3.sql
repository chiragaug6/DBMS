--1. Write a SQL query to find those employees who work for the department where the departmental allotment 
--amount is more than Rs. 50000. Return emp_fname and emp_lname. 

SELECT 
    e.emp_fname, 
    e.emp_lname
FROM 
    Employees e
WHERE 
    e.emp_dept IN (SELECT d.dpt_code 
                   FROM Departments d 
                   WHERE d.dpt_allotment > 50000);


--2. Write a SQL query to find the departments whose sanction amount is higher than the average sanction 
--amount for all departments. Return dpt_code, dpt_name and dpt_allotment. 

SELECT 
    d.dpt_code, 
    d.dpt_name, 
    d.dpt_allotment
FROM 
    Departments d
WHERE 
    d.dpt_allotment > (SELECT AVG(d2.dpt_allotment) 
                       FROM Departments d2);

--3. Write a SQL query to find which departments have more than two employees. Return dpt_name. 

SELECT 
    d.dpt_name
FROM 
    Departments d
WHERE 
    (SELECT COUNT(*) 
     FROM Employees e 
     WHERE e.emp_dept = d.dpt_code) > 2;


--4. Write a SQL query to find the departments with the second lowest sanction amount. Return emp_fname and emp_lname 

SELECT EMP_FNAME, EMP_LNAME 
FROM EMP_DETAILS 
WHERE EMP_DEPT = (
    SELECT DPT_CODE 
    FROM EMP_DEPARTMENT 
    WHERE DPT_ALLOTMENT = (
        SELECT MIN(DPT_ALLOTMENT) 
        FROM EMP_DEPARTMENT 
        WHERE DPT_ALLOTMENT > (
            SELECT MIN(DPT_ALLOTMENT) 
            FROM EMP_DEPARTMENT
        )
    )
);

