use leetcode;

-- --------------------------------------------------------------------------
-- 11. Write a query to count how many active students enrolled in each year.
-- --------------------------------------------------------------------------

SELECT 
    YEAR(enrollment_date),
    COUNT(YEAR(enrollment_date)) AS active_enrollment_count
FROM
    student_master
WHERE
    is_active IS TRUE
GROUP BY YEAR(enrollment_date)
ORDER BY 1;

-- ------------------------------------------------------------------------
-- 12. Write a query to find the average age of students grouped by gender.
-- ------------------------------------------------------------------------

WITH student_age AS (
	SELECT 
    gender,
    ROUND(DATEDIFF(enrollment_date, date_of_birth) / 365,
            0) AS age
FROM
    student_master
)
SELECT 
    gender, ROUND(AVG(age), 0) AS avg_age
FROM
    student_age
GROUP BY gender
; 

SELECT 
    gender, ROUND(AVG(age), 0) AS avg_age
FROM
    (SELECT 
        gender, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
    FROM
        student_master) AS student_age
GROUP BY gender;

-- -----------------------------------------------------------------------------------
-- 13. Write a query to get the date of birth of the youngest student for each gender.
-- -----------------------------------------------------------------------------------

SELECT 
    gender, MAX(date_of_birth) AS date_of_birth
FROM
    student_master
GROUP BY gender;

-- ---------------------------------------------------------------------
-- 14. Write a query to find the latest enrollment date for each gender.
-- ---------------------------------------------------------------------

SELECT 
    gender, MAX(enrollment_date) AS enrollment_date
FROM
    student_master
GROUP BY gender;

-- ---------------------------------------------------------------------------------------------------
-- 15. Write a query to show only those gender groups where the number of students is greater than 10.
-- ---------------------------------------------------------------------------------------------------

SELECT 
    gender
FROM
    (SELECT 
        gender, COUNT(gender) AS gender_count
    FROM
        student_master
    GROUP BY gender) AS student_gender
WHERE
    gender_count > 10;

SELECT 
    gender, COUNT(gender) AS gender_count
FROM
    student_master
GROUP BY gender
HAVING COUNT(gender) > 10;