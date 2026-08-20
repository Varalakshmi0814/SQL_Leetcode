-- Q.183 Write a SQL query to find all customers who never order anything.

CREATE TABLE Customers (
    Id INT PRIMARY KEY,
    Name VARCHAR(50)
);                                                                                                   

CREATE TABLE Orders (
    Id INT PRIMARY KEY,
    CustomerId INT,
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
);      

INSERT INTO Customers (Id, Name) VALUES (1, 'Joe');
INSERT INTO Customers (Id, Name) VALUES (2, 'Henry');
INSERT INTO Customers (Id, Name) VALUES (3, 'Sam');
INSERT INTO Customers (Id, Name) VALUES (4, 'Max');

INSERT INTO Orders (Id, CustomerId) VALUES (1, 3);
INSERT INTO Orders (Id, CustomerId) VALUES (2, 1);

SELECT 
    C.name
FROM
    customers c
        LEFT JOIN
    orders o ON c.id = o.customerId
WHERE
    C.ID NOT IN (SELECT 
            customerId
        FROM
            orders);
            
SELECT 
    C.name
FROM
    customers c
WHERE
    ID NOT IN (SELECT 
            customerId
        FROM
            orders);