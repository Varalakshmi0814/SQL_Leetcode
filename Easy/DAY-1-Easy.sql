create database Leetcode;
use leetcode;

create table student_master(
student_id INT Auto_increment primary key,
first_name varchar(100),
last_name  varchar(100),
date_of_birth date,
gender enum('M','F','O'),
contact_number varchar(20),
address varchar(255),
enrollment_date date,
is_active Boolean default true
);

INSERT INTO student_master
(first_name, last_name, date_of_birth, gender, contact_number, address, enrollment_date, is_active)
VALUES
('Alice',   'Brown',   '2005-03-12', 'F', '555-1111', '123 Elm Street',   '2021-09-01', TRUE),
('Bob',     'Smith',   '2004-07-22', 'M', '555-2222', '456 Oak Avenue',   '2022-01-15', TRUE),
('Charlie', 'Davis',   '2006-01-05', 'M', '555-3333', '789 Pine Road',    '2022-09-01', TRUE),
('Diana',   'Wilson',  '2003-12-18', 'F', '555-4444', '321 Maple Lane',   '2020-06-10', FALSE),
('Ethan',   'Clark',   '2004-09-30', 'M', '555-5555', '654 Spruce Drive', '2021-03-20', TRUE),
('Fiona',   'Adams',   '2005-11-02', 'F', '555-6666', '987 Birch Court',  '2022-11-10', TRUE),
('George',  'Green',   '2003-05-07', 'M', '555-7777', '111 Cedar Way',    '2019-08-30', TRUE),
('Hannah',  'Collins', '2004-02-11', 'F', '555-8888', '222 Walnut Circle','2020-01-12', TRUE),
('Ian',     'Miller',  '2003-10-25', 'M', '555-9999', '333 Aspen Road',   '2019-07-25', FALSE),
('Jasmine', 'Taylor',  '2005-06-16', 'F', '555-0000', '444 Poplar Street','2021-11-01', TRUE);

UPDATE student_master 
SET 
    first_name = 'Ian'
WHERE
    student_id = 2;

SELECT 
    *
FROM
    student_master;

-- ---------------------------------------------------------------------------
-- 1. Write a query to fetch all details of students who are currently active.
-- ---------------------------------------------------------------------------

SELECT 
    *
FROM
    student_master
WHERE
    is_active = TRUE;

-- ---------------------------------------------------------------------
-- 2. Write a query to retrieve all students whose first name is "John".	
-- ---------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    student_master
WHERE
    first_name = 'John';	
    
-- -------------------------------------------------------------
-- 3. Write a query to list students born after January 1, 2000.
-- -------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    student_master
WHERE
    date_of_birth > '2000-01-01';
    
-- -------------------------------------------------------------------------------
-- 4. Write a query to get all female students who enrolled after January 1, 2022.
-- -------------------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    student_master
WHERE
    gender = 'F'
        AND enrollment_date > '2022-01-01';	
        
-- -----------------------------------------------------------------------------
-- 5. Write a query to find students whose last names start with the letter 'S'.
-- -----------------------------------------------------------------------------

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    student_master
WHERE
    last_name LIKE 'S%';	
