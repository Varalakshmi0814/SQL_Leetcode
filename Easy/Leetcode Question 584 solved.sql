-- Q.584 Write a query to return the list of customers NOT referred by the person with id ‘2’.

CREATE TABLE Employees2 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    referee_id INT
);

INSERT INTO Employees2 (id, name, referee_id) VALUES (1, 'Will', NULL);
INSERT INTO Employees2 (id, name, referee_id) VALUES (2, 'Jane', NULL);
INSERT INTO Employees2 (id, name, referee_id) VALUES (3, 'Alex', 2);
INSERT INTO Employees2 (id, name, referee_id) VALUES (4, 'Bill', NULL);
INSERT INTO Employees2 (id, name, referee_id) VALUES (5, 'Zack', 1);
INSERT INTO Employees2 (id, name, referee_id) VALUES (6, 'Mark', 2);

select * from employees2;

SELECT 
    name
FROM
    employees2
WHERE
    name NOT IN (SELECT 
            name
        FROM
            employees2
        WHERE
            referee_id = 2);
            
SELECT 
    name
FROM
    employees2
WHERE
    referee_id <> 2 OR referee_id IS NULL;
