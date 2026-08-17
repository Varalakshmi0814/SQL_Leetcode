-- -----------------------------------------------------------------------------------------------------------------
-- 21. Write a query to get students whose date of birth is either before January 1, 2000, or after January 1, 2010.
-- -----------------------------------------------------------------------------------------------------------------

SELECT 
    first_name, last_name
FROM
    student_master
WHERE
    date_of_birth < '2000-01-01'
        OR date_of_birth > '2010-01-01';
        
-- -----------------------------------------------------------------------------------------------
-- 22. Write a query to count how many students enrolled in each month, grouped by year and month.
-- -----------------------------------------------------------------------------------------------

SELECT 
    YEAR(enrollment_date) AS enrollment_year,
    MONTH(enrollment_date) AS enrollment_month,
    COUNT(student_id) AS student_count
FROM
    student_master
GROUP BY YEAR(enrollment_date) , MONTH(enrollment_date)
ORDER BY 1;