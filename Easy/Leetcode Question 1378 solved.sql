-- Q.1378 Write an SQL query to show the unique ID of each user, If a user doesn't have a unique ID replace just show null.

drop table if exists Employee5;
CREATE TABLE Employee5 (
    id INT PRIMARY KEY,
    emp_name VARCHAR(50)
);

CREATE TABLE EmployeeUNI (
    id INT,
    unique_id INT PRIMARY KEY
);

INSERT INTO Employee5 (id, emp_name) VALUES
(1, 'Alice'),
(7, 'Bob'),
(11, 'Meir'),
(90, 'Winston'),
(3, 'Jonathan');

INSERT INTO EmployeeUNI (id, unique_id) VALUES
(3, 1),
(11, 2),
(90, 3);

Select * from Employee5;
Select * from EmployeeUNI;

SELECT 
    IFNULL(unique_id, NULL) AS unique_id, emp_name
FROM
    employee5 e
        LEFT JOIN
    employeeuni u ON e.id = u.id
ORDER BY 1;
