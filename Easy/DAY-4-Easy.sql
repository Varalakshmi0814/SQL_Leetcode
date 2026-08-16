-- ---------------------------------------------------------------------------------
-- 16. Write a query to show gender groups where the average student age is over 20.
-- ---------------------------------------------------------------------------------

    
SELECT 
    gender, ROUND(AVG(age), 0) AS avg_age
FROM
    (SELECT 
        gender,
            (TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS age
    FROM
        student_master) AS avg_student_age
GROUP BY gender
HAVING AVG(age) > 20;
    
-- --------------------------------------------------------------------------------------------
-- 17. Write a query to list enrollment years where more than 5 students were actively enrolled.
-- --------------------------------------------------------------------------------------------

SELECT 
    enrollment_year
FROM
    (SELECT 
        YEAR(enrollment_date) AS enrollment_year,
            COUNT(YEAR(enrollment_date)) AS active_enrollment_count
    FROM
        student_master
    WHERE
        is_active IS TRUE
    GROUP BY YEAR(enrollment_date)
    ORDER BY 1) student_enrollment_year
WHERE
    active_enrollment_count > 2;
    
SELECT 
    YEAR(enrollment_date) AS enrollment_year,
    COUNT(YEAR(enrollment_date)) AS active_enrollment_count
FROM
    student_master
WHERE
    is_active IS TRUE
GROUP BY YEAR(enrollment_date)
HAVING COUNT(YEAR(enrollment_date)) > 2
ORDER BY 1;
    
-- --------------------------------------------------------------------------------------------
-- 18. Write a query to count the number of active male students for each enrollment year.
-- --------------------------------------------------------------------------------------------

SELECT 
    YEAR(enrollment_date) AS enrollment_year,
    COUNT(gender) AS active_male_students
FROM
    student_master
WHERE
    gender = 'M' AND is_active IS TRUE
GROUP BY YEAR(enrollment_date);

-- --------------------------------------------------------------------------------------------
-- 19. Write a query to retrieve the details of the first 5 students who enrolled in 2024.
-- --------------------------------------------------------------------------------------------

SELECT 
    *
FROM
    student_master
WHERE
    YEAR(enrollment_date) = 2022
ORDER BY student_id
LIMIT 5;

-- -------------------------------------------------------------------------------------------------------------------
-- 20. Write a query to count students in each gender group and sort the results in descending order of student count.
-- -------------------------------------------------------------------------------------------------------------------

SELECT 
    gender, COUNT(student_id) AS student_count
FROM
    student_master
GROUP BY gender
ORDER BY 2 DESC;