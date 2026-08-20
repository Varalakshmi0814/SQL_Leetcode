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
    