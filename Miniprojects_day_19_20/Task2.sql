-- Miniproject-2: Student Attendance Tracker

CREATE DATABASE IF NOT EXISTS project_2_db;
USE project_2_db;

DROP TABLE IF EXISTS Attendance;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    date DATE,
    status ENUM('Present', 'Absent'),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO Courses VALUES
(1, 'Math'),
(2, 'Science');

INSERT INTO Attendance VALUES
(1, 1, 1, '2025-06-01', 'Present'),
(2, 1, 1, '2025-06-02', 'Present'),
(3, 1, 1, '2025-06-03', 'Absent'),
(4, 2, 1, '2025-06-01', 'Present'),
(5, 2, 1, '2025-06-02', 'Present'),
(6, 2, 1, '2025-06-03', 'Present'),
(7, 3, 2, '2025-06-01', 'Absent'),
(8, 3, 2, '2025-06-02', 'Present'),
(9, 3, 2, '2025-06-03', 'Present');

SELECT s.name, c.name AS course_name,
    ROUND(SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attendance_percentage
FROM Attendance a
JOIN Students s ON a.student_id = s.student_id
JOIN Courses c ON a.course_id = c.course_id
GROUP BY s.name, c.name
HAVING attendance_percentage > 90;

SELECT s.name, c.name AS course_name, a.date
FROM Attendance a
JOIN Students s ON a.student_id = s.student_id
JOIN Courses c ON a.course_id = c.course_id
WHERE a.status = 'Absent' AND a.date = '2025-06-03';
