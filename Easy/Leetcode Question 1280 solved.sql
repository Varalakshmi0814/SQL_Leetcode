-- Q.1280 Write an SQL query to find the number of times each student attended each exam.
-- Order the result table by student_id and subject_name.

CREATE TABLE Students1 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE Subjects (
    subject_name VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Examinations (
    student_id INT,
    subject_name VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES Students1(student_id),
    FOREIGN KEY (subject_name) REFERENCES Subjects(subject_name)
);

INSERT INTO Students1 (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');


INSERT INTO Subjects (subject_name) VALUES
('Math'),
('Physics'),
('Programming');

INSERT INTO Examinations (student_id, subject_name) VALUES
(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Math'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2, 'Math'),
(1, 'Math');

select * from Students1;
select * from Subjects;
select * from Examinations;


select s.student_id, s.student_name, sb.subject_name, count(e.student_id) as attended_exams from students1 s
left join examinations e on s.student_id = e.student_id
left join subjects sb on e.subject_name = sb.subject_name
group by s.student_id, subject_name;

SELECT Students1.student_id, student_name, Subjects.subject_name, COUNT(Examinations.student_id) AS attended_exams
FROM Students1 JOIN Subjects
LEFT JOIN Examinations
ON Students1.student_id = Examinations.student_id AND Subjects.subject_name = Examinations.subject_name
GROUP BY Students1.student_id, subject_name;