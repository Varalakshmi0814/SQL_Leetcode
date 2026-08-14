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