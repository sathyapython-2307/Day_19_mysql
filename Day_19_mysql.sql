CREATE DATABASE School;
USE School;
CREATE TABLE students(
studentid INT PRIMARY KEY,
Name VARCHAR(50),
Age INT,
Department VARCHAR(50));

CREATE TABLE courses(
courseid INT PRIMARY KEY,
Title VARCHAR(50),
Credits INT);

INSERT INTO students(studentid,Name,Age,Department) VALUES (1,"Murugan",21,"cse");
INSERT INTO students(studentid,Name,Age,Department) VALUES (2,"Kandhan",21,"mech");
INSERT INTO students(studentid,Name,Age,Department) VALUES (3,"Murugan",21,"civil");
SELECT * FROM students;
INSERT INTO courses(courseid,Title,Credits) VALUES (111,"Full Stack",5),(112,"Mern Stack",5);

INSERT INTO students(studentid,Name,Age,Department) VALUES (4,"Kathirvelan",21,"EEE"),(5,"Kumaran",23,"ECE"),(6,"Velavan",19,"cyber");

SELECT * FROM students;
SELECT Name,Age FROM students;

SELECT * FROM courses;
SELECT DISTINCT Department FROM students;
SELECT * FROM courses 
WHERE Credits>3;

SELECT Department,Name FROM students
WHERE Department="cse";

SELECT Name,Age from students
WHERE Age!=18;

SELECT NAME from students
where Name like "a%";

SELECT NAME from students
where Name like "%n%";

INSERT INTO students(studentid,Name,Age,Department) VALUES (7,"Vel",18,"Automobile");

SELECT NAME from students
where Name like  "____";

SELECT NAME,Age from students
where Age between 18 and 22;

SELECT courseid,Title from courses
where courseid in (111,112);
select * from courses;

SELECT Name,Department from students
WHERE Department NOT IN ("Physics");

SELECT Name,Department from students
WHERE Department IS NULL;

SELECT Name,Department from students
WHERE Department IS NOT NULL;

SELECT Name,Age,Department from students
WHERE Age>18 and Department='Mathematics';

SELECT NAME,Department from students
WHERE Department='Biology' or Department='Chemistry';

SELECT NAME,Department,Age FROM students
WHERE Department!='History' and Age<21;

-- by default all are ascending

SELECT * from courses
ORDER BY Credits DESC;

SELECT NAME,Department,Age from students
ORDER BY Age DESC;

SELECT *FROM students
LIMIT 5;

INSERT INTO courses(courseid,Title,Credits) VALUES (113,"Python",5),(114,"javascript",5);

SELECT Title,Credits FROM courses
ORDER BY Credits DESC LIMIT 3;

ALTER TABLE students
ADD email VARCHAR(100);

UPDATE students
SET email="murugan21@gmail.com"
WHERE studentid=1;

INSERT INTO students(studentid,Name,Age,Department) VALUES (8,"Maheshwaren",31,"cse");

SELECT *FROM students;
set sql_safe_updates=0;
DELETE FROM students 
WHERE Age>25;

SELECT *FROM students;

DELETE FROM courses
WHERE courseid=114;


INSERT INTO students(studentid,Name,Age,Department) VALUES (9,"Vishagan",20,"");

SELECT *FROM students;

DELETE FROM students
WHERE studentid=9;

INSERT INTO students(studentid,Name,Age) VALUES (9,"Vishagan",20);

SELECT *FROM students
WHERE Department IS NULL;

UPDATE students
SET Department="Engineering"
WHERE Name="Murugan";

UPDATE students
SET Age=Age+1;

SELECT *FROM students;

SELECT Name from students
where Name like '%a';
SELECT *FROM students;

SELECT Name from students
where Name like '%ar%';


SELECT Name,Department,Age from students
WHERE Department='EEE' or Department='Engineering' ORDER BY Age DESC;


SELECT DISTINCT Age,Name,Department from students
Where Department IS NOT NULL;

select *from students
ORDER BY Name limit 3;

delete from students
where Department is null;

select *from students;


















 








