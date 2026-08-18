-- -----------------------------------------------------------------------------------
-- 31. Write a query to get students whose enrollment date is exactly January 1, 2023.
-- -----------------------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS Student_Name
FROM
    student_master
WHERE
    enrollment_date = '2023-01-01';