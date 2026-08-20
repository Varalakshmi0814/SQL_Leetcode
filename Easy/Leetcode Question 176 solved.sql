use leetcode;

-- Q.176 Write a SQL query to get the second highest salary from the Employee table.

CREATE TABLE Employees (
    Id INT PRIMARY KEY,
    Salary INT
);

INSERT INTO Employees (Id, Salary) VALUES (1, 100);
INSERT INTO Employees (Id, Salary) VALUES (2, 200);
INSERT INTO Employees (Id, Salary) VALUES (3, 300);

select * from employees;

SELECT 
    MAX(salary) AS second_highest_sal
FROM
    employees
WHERE
    salary < (SELECT 
            MAX(salary)
        FROM
            employees);

-- using window function and cte

with salary_rank as (
select salary, dense_rank() over(order by salary desc) denserank from employees)
SELECT 
    salary second_highest_sal
FROM
    salary_rank
WHERE
    denserank = 2;