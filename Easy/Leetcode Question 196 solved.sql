-- Q.196 Write a SQL query to delete all duplicate email entries in a table named Person/USERS, keeping only unique emails based on its smallest Id.

SELECT * FROM USERS;

DELETE U2
FROM USERS U1
JOIN USERS U2
ON U1.EMAIL = U2.EMAIL
WHERE U1.ID < U2.ID;