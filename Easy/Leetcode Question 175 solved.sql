use leetcode;

-- Q.175 Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:

CREATE TABLE Persons (
    PersonId INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255)
);                                                                                         

CREATE TABLE Address (
    AddressId INT PRIMARY KEY,
    PersonId INT,
    City VARCHAR(255),
    State VARCHAR(255),
    FOREIGN KEY (PersonId) REFERENCES Persons(PersonId)
);


SELECT 
    p.firstname, p.lastname, a.city, a.state
FROM
    persons p
        LEFT JOIN
    address a ON p.PersonId = a.PersonId;