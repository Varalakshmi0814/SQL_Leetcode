create database medium_leetcode;
use medium_leetcode;

-- Q.177 Write a SQL query to get the nth highest salary from the Employee table.

drop table if exists Salaries;
CREATE TABLE Salaries (
    Id INT PRIMARY KEY,
    Salary DECIMAL(10, 2)
);

INSERT INTO Salaries (Id, Salary) VALUES
(1, 100),
(2, 200),
(3, 300),
(4, 300),
(5, 400);

Delimiter $$
create function get_nth_highest_salary(n INT) 
Returns INT
reads sql data
begin
	set n = n-1;
    Return(
		select distinct salary from salaries
        order by 1 desc
        limit 1 offset n
        );
end $$

select get_nth_highest_salary(3);


-- Q.178 Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. 
-- Note that after a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no "holes" between ranks.

CREATE TABLE Scores (		
    Id INT PRIMARY KEY,		
    Score DECIMAL(4, 2)		
);		
		
INSERT INTO Scores (Id, Score) VALUES		
(1, 3.50),		
(2, 3.65),		
(3, 4.00),		
(4, 3.85),		
(5, 4.00),		
(6, 3.65);		

select score, dense_rank() over(order by score desc) as ranks from scores;

-- Q.180 Write an SQL query to find all numbers that appear at least three times consecutively.

drop table if exists Logs;
CREATE TABLE Logs (
    Id INT PRIMARY KEY,
    Num INT
);

INSERT INTO Logs (Id, Num) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 1),
(6, 2),
(7, 2),
(8, 2);

with prev_num as (select id, num, lag(num) over(order by id) as previous_num, lag(num, 2) over(order by id) as number_before_previous from logs
order by id
)
select num from prev_num where num = previous_num and previous_num = number_before_previous 
order by id;

select a.num from logs a
join logs b 
on a.id = b.id+1 and a.num = b.num
join logs c
on a.id = c.id+2 and a.num = c.num;


-- Q.184 Write a SQL query to find employees who have the highest salary in each of the departments. 
-- For the above tables, your SQL query should return the following rows (order of rows does not matter).

drop table if exists Employees;		
CREATE TABLE Employees (		
    Id INT PRIMARY KEY,		
    Name VARCHAR(50),		
    Salary INT,		
    DepartmentId INT		
);		
		
CREATE TABLE Departments (		
    Id INT PRIMARY KEY,		
    Name VARCHAR(50)		
);		
		
INSERT INTO Employees (Id, Name, Salary, DepartmentId) VALUES		
(1, 'Joe', 70000, 1),		
(2, 'Jim', 90000, 1),		
(3, 'Henry', 80000, 2),		
(4, 'Sam', 60000, 2),		
(5, 'Max', 90000, 1);		
		
INSERT INTO Departments (Id, Name) VALUES		
(1, 'IT'),		
(2, 'Sales');		
		
Select * from Employees;		
Select * from Departments;	


SELECT Departments.Name AS Department, Employees.Name AS Employee, Salary
FROM Employees
JOIN Departments
ON Employees.DepartmentId = Departments.Id
WHERE (DepartmentId, Salary) IN(
        SELECT  DepartmentId, MAX(Salary) AS Salary
        FROM Employees
        GROUP BY DepartmentId
        );


-- Q.534 Write an SQL query that reports for each player and date, how many games played so far by the player.
-- That is, the total number of games played by the player until that date. 
	
drop table if exists Activity;	
CREATE TABLE Activity (	
    player_id INT,	
    device_id INT,	
    event_date DATE,	
    games_played INT	
);	
	
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES	
(1, 2, '2016-03-01', 5),	
(1, 2, '2016-05-02', 6),	
(1, 3, '2017-06-25', 1),	
(3, 1, '2016-03-02', 0),	
(3, 4, '2018-07-03', 5);	
	
Select * from Activity;	

select player_id, event_date, SUM(games_played) OVER (partition by player_id ORDER BY event_date) AS running_total from activity;
