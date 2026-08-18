-- ---------------------------------------------------------------------
-- 26. Write a query to get all students with even-numbered student IDs.
-- ---------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS Student_name
FROM
    student_master
WHERE
    student_id % 2 = 0;
    
-- ------------------------------------------------------------------------------------------------------------------
-- 27. Write a query to show gender groups where there are more than 5 students and their average age is less than 25.
-- ------------------------------------------------------------------------------------------------------------------

SELECT 
    gender, COUNT(1) AS gender_count
FROM
    student_master
GROUP BY gender
HAVING COUNT(1) > 4 
UNION 
SELECT 
    gender, ROUND(AVG(age), 0) AS avg_age
FROM
    (SELECT 
        gender, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
    FROM
        student_master) student_avg_age
GROUP BY gender
HAVING AVG(age) > 25;

-- --------------------------------------------------------------------------------------------------------------
-- 28. Write a query to count active students by gender, but only show results where the count is greater than 2.
-- --------------------------------------------------------------------------------------------------------------

SELECT 
    gender, COUNT(1) AS active_students
FROM
    student_master
WHERE
    is_active IS TRUE
GROUP BY gender
HAVING COUNT(1) > 2;

-- -----------------------------------------------------------------------------------------
-- 29. Write a query to retrieve students whose contact number starts with the digits "123".
-- -----------------------------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS student_name,
    contact_number
FROM
    student_master
WHERE
    contact_number LIKE '123%';
    
-- ------------------------------------------------------------------------------------------------------------------
-- 30. Write a query to count the number of students classified as either "Adult" (18 or older) or "Minor" (under 18).
-- ------------------------------------------------------------------------------------------------------------------

with student_age_group as ( 
with students as (
SELECT 
    *,
    TIMESTAMPDIFF(YEAR,
        date_of_birth,
        CURDATE()) AS age
FROM
    student_master
) 
SELECT 
    *,
    CASE
        WHEN age < 18 THEN 'Minor'
        WHEN age >= 18 THEN 'Adult'
    END AS age_group
FROM
    students
) 
select 
	age, age_group, count(1) over(partition by age_group) as age_group_count  
from 
	student_age_group;
    
-- ------------------------------------------------------------------------------------------------------------------

with student_age_group as ( 
with students as (
SELECT 
    *,
    TIMESTAMPDIFF(YEAR,
        date_of_birth,
        enrollment_date) AS age
FROM
    student_master
) 
SELECT 
    *,
    CASE
        WHEN age < 18 THEN 'Minor'
        WHEN age >= 18 THEN 'Adult'
    END AS age_group
FROM
    students
) SELECT 
    age_group, COUNT(1)
FROM
    student_age_group
GROUP BY age_group
;

