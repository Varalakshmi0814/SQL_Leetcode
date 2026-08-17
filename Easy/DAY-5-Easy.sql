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