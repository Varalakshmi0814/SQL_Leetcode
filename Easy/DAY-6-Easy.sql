-- ---------------------------------------------------------------------
-- 26. Write a query to get all students with even-numbered student IDs.
-- ---------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS Student_name
FROM
    student_master
WHERE
    student_id % 2 = 0;