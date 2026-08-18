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

-- -------------------------------------------------------------------------------
-- 33. Write a query to get students whose last name contains the substring "son".
-- -------------------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS Student_Name
FROM
    student_master
WHERE
    last_name LIKE '%son%';

-- ----------------------------------------------------------------------
-- 34. Write a query to count how many students were born in each decade.
-- ----------------------------------------------------------------------

SELECT 
    COUNT(CASE
        WHEN YEAR(date_of_birth) BETWEEN 2000 AND 2010 THEN 'YES'
    END) AS decade
FROM
    student_master;
    
SELECT
    FLOOR(YEAR(date_of_birth) / 10) * 10 AS birth_decade,
    COUNT(*) AS student_count
FROM student_master
GROUP BY FLOOR(YEAR(date_of_birth) / 10) * 10
ORDER BY birth_decade;