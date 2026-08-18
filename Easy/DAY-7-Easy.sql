-- -----------------------------------------------------------------------------------
-- 31. Write a query to get students whose enrollment date is exactly January 1, 2023.
-- -----------------------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS Student_Name
FROM
    student_master
WHERE
    enrollment_date = '2023-01-01';

-- ---------------------------------------------------------------------------------------
-- 32. Write a query to list all students who are either inactive or enrolled before 2020.
-- ---------------------------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS Student_Name
FROM
    student_master
WHERE
    YEAR(enrollment_date) < '2020-01-01'
        OR is_active IS FALSE;