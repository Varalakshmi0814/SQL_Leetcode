use leetcode;

-- ---------------------------------------------------------------------------
-- 6. Write a query to fetch details of students with student IDs 1, 3, and 5.
-- ---------------------------------------------------------------------------

SELECT 
    *
FROM
    student_master
WHERE
    student_id IN (1 , 3, 5);

-- ------------------------------------------------------------------------
-- 7. Write a query to retrieve all students except those with IDs 2 and 4.
-- ------------------------------------------------------------------------

SELECT 
    *
FROM
    student_master
WHERE
    student_id NOT IN (2 , 4);
    
-- -------------------------------------------------------------------------------------------
-- 8. Write a query to get students who enrolled between January 1, 2023, and January 1, 2024.
-- -------------------------------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    student_master
WHERE
    enrollment_date BETWEEN '2023-01-01' AND '2024-01-01';

-- -------------------------------------------------------------------
-- 9. Write a query to list students who do not have a contact number.
-- -------------------------------------------------------------------

SELECT 
    *
FROM
    student_master
WHERE
    contact_number IS NULL;
    
-- ------------------------------------------------------------------
-- 10. Write a query to count the number of students for each gender.
-- ------------------------------------------------------------------

SELECT 
    gender, COUNT(gender) AS gender_count
FROM
    student_master
GROUP BY gender;

SELECT 
    gender, COUNT(1) AS gender_count
FROM
    student_master
GROUP BY gender;