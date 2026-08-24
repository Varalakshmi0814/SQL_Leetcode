-- Q.1075 Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

CREATE TABLE Employee3 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    experience_years INT
);

drop table if exists Project;
CREATE TABLE Project (
    project_id INT,
    employee_id INT,
    PRIMARY KEY (project_id, employee_id)
);

INSERT INTO Employee3 (employee_id, name, experience_years) VALUES
(1, 'Khaled', 3),
(2, 'Ali', 2),
(3, 'John', 1),
(4, 'Doe', 2);

INSERT INTO Project (project_id, employee_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4);

select * from Employee3;
select * from Project; 

SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM
    project p
        JOIN
    employee3 e ON p.employee_id = e.employee_id
GROUP BY p.project_id;