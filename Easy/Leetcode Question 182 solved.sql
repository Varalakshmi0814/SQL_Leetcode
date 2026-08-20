-- Q.182 Write a SQL query to find all duplicate emails in a table named User Or Person.

CREATE TABLE Users (
    Id INT PRIMARY KEY,
    Email VARCHAR(255)
);

INSERT INTO Users (Id, Email) VALUES (1, 'a@b.com');
INSERT INTO Users (Id, Email) VALUES (3, 'a@b.com');
INSERT INTO Users (Id, Email) VALUES (2, 'c@d.com');

select * from users;

SELECT 
    email, COUNT(1)
FROM
    users
GROUP BY email
HAVING COUNT(1) > 1;

-- window funcion

WITH CTE AS(
SELECT Email, row_number() OVER(PARTITION BY Email ORDER BY Email) AS RN
    FROM users
)
SELECT Email
FROM CTE
WHERE RN > 1;