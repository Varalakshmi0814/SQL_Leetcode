-- Q.577 Select all employee’s name and bonus whose bonus is < 1000.

CREATE TABLE Employees1 (	
    empId INT PRIMARY KEY,	
    name VARCHAR(50),	
    supervisor INT,	
    salary INT	
);	
	
CREATE TABLE Bonuses (	
    empId INT,	
    bonus INT,	
    PRIMARY KEY (empId)	
    	
);	
	
INSERT INTO Employees1 (empId, name, supervisor, salary) VALUES (1, 'John', 3, 1000);	
INSERT INTO Employees1 (empId, name, supervisor, salary) VALUES (2, 'Dan', 3, 2000);	
INSERT INTO Employees1 (empId, name, supervisor, salary) VALUES (3, 'Brad', NULL, 4000);	
INSERT INTO Employees1 (empId, name, supervisor, salary) VALUES (4, 'Thomas', 3, 4000);	
	
INSERT INTO Bonuses (empId, bonus) VALUES (2, 500);	
INSERT INTO Bonuses (empId, bonus) VALUES (4, 2000);	

select * from employees1;
select * from bonuses;

select e.name, b.bonus from employees1 e
left join bonuses b 
on e.empid = b.empid
where b.bonus<1000 or b.bonus is null
order by 1 desc;