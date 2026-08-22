-- Q.596 Please list out all classes which have more than or equal to 5 students.

CREATE TABLE Students (
    student VARCHAR(50) PRIMARY KEY,
    class VARCHAR(50)
);


INSERT INTO Students (student, class) VALUES ('A', 'Math');
INSERT INTO Students (student, class) VALUES ('B', 'English');
INSERT INTO Students (student, class) VALUES ('C', 'Math');
INSERT INTO Students (student, class) VALUES ('D', 'Biology');
INSERT INTO Students (student, class) VALUES ('E', 'Math');
INSERT INTO Students (student, class) VALUES ('F', 'Computer');
INSERT INTO Students (student, class) VALUES ('G', 'Math');
INSERT INTO Students (student, class) VALUES ('H', 'Math');
INSERT INTO Students (student, class) VALUES ('I', 'Math');

select * from Students;
   
   
select class from students
group by class
having count(1) >=5;

select class from students
group by class
having count(distinct student) >=5;