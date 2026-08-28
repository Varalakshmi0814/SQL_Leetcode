-- Q.1350 Write an SQL query to find the id and the name of all students who are enrolled in departments that no longer exists.

drop table if exists Departments1;
CREATE TABLE Departments1 (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);


drop table if exists Students2;
CREATE TABLE Students2 (
    id INT PRIMARY KEY,
    stu_name VARCHAR(50),
    department_id INT
    
);

INSERT INTO Departments1 (id, dept_name) VALUES
(1, 'Electrical Engineering'),
(7, 'Computer Engineering'),
(13, 'Business Administration');


INSERT INTO Students2 (id, stu_name, department_id) VALUES
(23, 'Alice', 1),
(1, 'Bob', 7),
(5, 'Jennifer', 13),
(2, 'John', 14),
(4, 'Jasmine', 77),
(3, 'Steve', 74),
(6, 'Luis', 1),
(8, 'Jonathan', 7),
(7, 'Daiana', 33),
(11, 'Madelynn', 1);

Select * from Departments1;
Select * from Students2;

SELECT 
    id, stu_name
FROM
    students2
WHERE
    department_id NOT IN (SELECT 
            id
        FROM
            departments1);
            