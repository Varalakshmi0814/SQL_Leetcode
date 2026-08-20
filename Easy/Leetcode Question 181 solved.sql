use leetcode;

-- Q.181 Given the Employee table, write a SQL query that finds out employees who earn more than their managers. 
-- For the above table, Joe is the only employee who earns more than his manager.

CREATE TABLE Employee (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary INT,
    ManagerId INT
);

INSERT INTO Employee (Id, Name, Salary, ManagerId) VALUES (1, 'Joe', 70000, 3);
INSERT INTO Employee (Id, Name, Salary, ManagerId) VALUES (2, 'Henry', 80000, 4);
INSERT INTO Employee (Id, Name, Salary, ManagerId) VALUES (3, 'Sam', 60000, NULL);
INSERT INTO Employee (Id, Name, Salary, ManagerId) VALUES (4, 'Max', 90000, NULL);

select * from employee;

-- using self join

select e1.name from employee e1 
join employee e2 
on e1.managerId = e2.id
where e1.salary > e2.salary;