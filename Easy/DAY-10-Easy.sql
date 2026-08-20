-- ---------------------------------------------------------------------------------------------------
-- 46. Write a query to count students by year of birth, only for years with at least 3 students born.
-- ---------------------------------------------------------------------------------------------------

SELECT 
    YEAR(date_of_birth),
    COUNT(YEAR(date_of_birth)) AS student_count
FROM
    student_master
GROUP BY YEAR(date_of_birth)
HAVING COUNT(YEAR(date_of_birth)) >= 3;

-- --------------------------------------------------------------------------------
-- 47. Write a query to get students who enrolled in the same month they were born.
-- --------------------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    student_master
WHERE
    MONTH(date_of_birth) = MONTH(enrollment_date);

-- ------------------------------------------------------------------------------------------------------
-- 48. Write a query to list students, displaying "Yes" if they are active and "No" if they are inactive.
-- ------------------------------------------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    CASE
        WHEN is_active = TRUE THEN 'Yes'
        ELSE 'No'
    END AS active_status
FROM
    student_master;
-- -------------------------------------------------------------------------------------
-- 49. Write a query to find students whose last names end with a vowel (A, E, I, O, U).
-- -------------------------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS Full_name
FROM
    student_master
WHERE
    RIGHT(last_name, 1) IN ('A' , 'E', 'I', 'O', 'U');
    
-- ------------------------------------------------------------------------------
-- 50. Write a query to calculate the number of days since each student enrolled.
-- ------------------------------------------------------------------------------

SELECT 
    DATEDIFF(CURDATE(), enrollment_date) AS num_of_days
FROM
    student_master;
    