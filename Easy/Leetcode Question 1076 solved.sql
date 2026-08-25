-- Q.1076 Write an SQL query that reports all the projects that have the most employees.

SELECT 
    project_id
FROM
    project p
GROUP BY project_id
ORDER BY COUNT(1) DESC
LIMIT 1;