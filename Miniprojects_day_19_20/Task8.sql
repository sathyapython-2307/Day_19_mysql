-- Miniproject-8: School Grading System

CREATE DATABASE IF NOT EXISTS project_8_db;
USE project_8_db;

DROP TABLE IF EXISTS Grades;
DROP TABLE IF EXISTS Subjects;
DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Grades (
    grade_id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    grade FLOAT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

INSERT INTO Students VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

INSERT INTO Subjects VALUES
(1, 'Math'),
(2, 'Science'),
(3, 'English');

INSERT INTO Grades VALUES
(1, 1, 1, 95.0),
(2, 1, 2, 88.0),
(3, 2, 1, 91.0),
(4, 2, 2, 76.0),
(5, 3, 1, 67.0),
(6, 3, 3, 98.0),
(7, 4, 2, 55.0),
(8, 4, 3, 42.0);

SELECT s.name AS student, subj.name AS subject, g.grade
FROM Grades g
JOIN Students s ON g.student_id = s.student_id
JOIN Subjects subj ON g.subject_id = subj.subject_id
WHERE (g.subject_id, g.grade) IN (
    SELECT subject_id, MAX(grade)
    FROM Grades
    GROUP BY subject_id
);

SELECT s.name, subj.name AS subject, g.grade
FROM Grades g
JOIN Students s ON g.student_id = s.student_id
JOIN Subjects subj ON g.subject_id = subj.subject_id
WHERE g.grade < 50.0;
