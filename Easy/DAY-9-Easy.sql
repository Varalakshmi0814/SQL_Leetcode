-- ----------------------------------------------------------------
-- 41. Write a query to list all students who enrolled on a Monday.
-- ----------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    student_master
WHERE
    DAYOFWEEK(enrollment_date) = 2;

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    student_master
WHERE
    WEEKDAY(enrollment_date) = 0;
    
-- ---------------------------------------------------------------------------------
-- 42. Write a query to get students whose contact number is exactly 10 digits long.
-- ---------------------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    student_master
WHERE
    LENGTH(contact_number) = 10;
    
-- -----------------------------------------------------------------------------------------------------
-- 43. Write a query to calculate the total number of students grouped by both gender and active status.
-- -----------------------------------------------------------------------------------------------------

SELECT 
    gender, COUNT(1) AS student_total
FROM
    student_master
WHERE
    is_active IS TRUE
GROUP BY gender , is_active;

-- ------------------------------------------------------------------------------
-- 44. Write a query to find students whose names are palindromes (e.g., "Anna").
-- ------------------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    student_master
WHERE
    first_name = REVERSE(first_name)
        OR last_name = REVERSE(last_name);
        
-- ----------------------------------------------------------------------------------
-- 45. Write a query to show the first three characters of each student's first name.
-- ----------------------------------------------------------------------------------

SELECT 
    first_name, SUBSTR(first_name, 1, 3) AS first_three_chars
FROM
    student_master;