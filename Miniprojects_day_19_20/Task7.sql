-- Miniproject-7: Restaurant Reservation System

CREATE DATABASE IF NOT EXISTS project_7_db;
USE project_7_db;

DROP TABLE IF EXISTS Reservations;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Tables;

CREATE TABLE Tables (
    table_id INT PRIMARY KEY,
    seats INT
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,
    customer_id INT,
    table_id INT,
    reservation_datetime DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (table_id) REFERENCES Tables(table_id)
);

INSERT INTO Tables VALUES
(1, 2),
(2, 4),
(3, 4),
(4, 6),
(5, 2);

INSERT INTO Customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

INSERT INTO Reservations VALUES
(1, 1, 1, '2025-07-03 18:00:00'),
(2, 2, 2, '2025-07-03 19:00:00'),
(3, 1, 3, '2025-07-04 18:00:00'),
(4, 3, 4, '2025-07-04 20:00:00'),
(5, 1, 5, '2025-07-05 18:00:00'),
(6, 1, 1, '2025-07-06 19:00:00');

SELECT t.table_id, t.seats
FROM Tables t
LEFT JOIN Reservations r ON t.table_id = r.table_id AND r.reservation_datetime = '2025-07-03 19:00:00'
WHERE r.table_id IS NULL;

SELECT c.name, COUNT(*) AS total_reservations
FROM Reservations r
JOIN Customers c ON r.customer_id = c.customer_id
GROUP BY c.customer_id
HAVING total_reservations > 2;
