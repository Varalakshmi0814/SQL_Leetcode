-- Q.1303 Write an SQL query to find the team size of each of the employees.
-- Return result table in any order.

CREATE TABLE Employee4 (
    employee_id INT PRIMARY KEY,
    team_id INT
);

INSERT INTO Employee4 (employee_id, team_id) VALUES
(1, 8),
(2, 8),
(3, 8),
(4, 7),
(5, 9),
(6, 9);

select * from employee4;

select e1.employee_id, count(e1.team_id) over(partition by e1.team_id) as Team_size 
from Employee4 e1 
order by 1 asc;

select e1.employee_id, count(*) over(partition by e1.team_id) as Team_size 
from Employee4 e1 
order by 1 asc;

SELECT 
    employee_id, b.team_size
FROM
    employee4 e
        JOIN
    (SELECT 
        team_id, COUNT(team_id) AS team_size
    FROM
        employee
    GROUP BY team_id) b ON e.team_id = b.team_id;