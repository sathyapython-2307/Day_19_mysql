-- Miniproject-3: Employee Payroll System

CREATE DATABASE IF NOT EXISTS project_3_db;
USE project_3_db;

DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    amount DECIMAL(10, 2),
    performance_rating INT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales');

INSERT INTO Employees VALUES
(1, 'Alice', 1),
(2, 'Bob', 2),
(3, 'Charlie', 2),
(4, 'David', 3),
(5, 'Eva', 1),
(6, 'Frank', 2),
(7, 'Grace', 3),
(8, 'Hannah', 3),
(9, 'Ian', 2),
(10, 'Julia', 1);

INSERT INTO Salaries VALUES
(1, 1, 50000, 4),
(2, 2, 75000, 5),
(3, 3, 72000, 3),
(4, 4, 60000, 2),
(5, 5, 51000, 5),
(6, 6, 80000, 4),
(7, 7, 58000, 3),
(8, 8, 59000, 5),
(9, 9, 79000, 2),
(10, 10, 53000, 4);

SELECT e.name, d.name AS department, s.amount
FROM Employees e
JOIN Salaries s ON e.employee_id = s.employee_id
JOIN Departments d ON e.department_id = d.department_id
WHERE d.name = 'IT' AND s.amount > 70000;

UPDATE Salaries
SET amount = amount * 1.10
WHERE performance_rating >= 4;
