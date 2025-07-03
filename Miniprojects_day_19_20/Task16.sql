-- Miniproject-16: University Course Enrollment System

CREATE DATABASE IF NOT EXISTS project_16_db;
USE project_16_db;

DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana');

INSERT INTO Courses VALUES
(1, 'Mathematics'),
(2, 'Physics'),
(3, 'Chemistry'),
(4, 'History');

INSERT INTO Enrollments VALUES
(1, 1, 1, '2025-06-15'),
(2, 1, 2, '2025-06-15'),
(3, 2, 2, '2025-06-16'),
(4, 2, 3, '2025-06-16'),
(5, 2, 4, '2025-06-16'),
(6, 3, 1, '2025-06-17'),
(7, 4, 1, '2025-06-18');

SELECT course_name
FROM Courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id FROM Enrollments
);

SELECT s.name, COUNT(e.course_id) AS enrolled_courses
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
GROUP BY s.student_id
HAVING enrolled_courses > 2;
