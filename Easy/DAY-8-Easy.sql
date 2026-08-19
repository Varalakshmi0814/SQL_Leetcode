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
