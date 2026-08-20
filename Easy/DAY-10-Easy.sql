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