-- ---------------------------------------------------------------------------------------
-- 36. Write a query to calculate the age of each student and display it as "current_age".
-- ---------------------------------------------------------------------------------------

SELECT 
    student_id,
    CONCAT(first_name, ' ', last_name) AS Student_Full_Name,
    TIMESTAMPDIFF(YEAR,
        date_of_birth,
        CURDATE()) AS current_age
FROM
    student_master;
    
-- ------------------------------------------------------------------
-- 37. Write a query to find the student with the longest first name.
-- ------------------------------------------------------------------

SELECT 
    first_name, last_name
FROM
    student_master
WHERE
    LENGTH(first_name) = (SELECT 
            MAX(LENGTH(first_name))
        FROM
            student_master);

-- ----------------------------------------------------------------
-- 38. Write a query to list students who have the same first name.
-- ----------------------------------------------------------------

SELECT 
    first_name, COUNT(student_id)
FROM
    student_master
GROUP BY first_name
HAVING COUNT(student_id) > 1;

-- ------------------------------------------------------------------------------------
-- 39. Write a query to count how many students have a NULL value in the address field.
-- ------------------------------------------------------------------------------------

SELECT 
    COUNT(1) AS address_null
FROM
    student_master
WHERE
    address = NULL;
