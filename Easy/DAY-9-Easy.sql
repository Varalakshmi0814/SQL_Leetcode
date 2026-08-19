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