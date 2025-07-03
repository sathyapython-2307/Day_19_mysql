-- Miniproject-9: Travel Agency Booking System

CREATE DATABASE IF NOT EXISTS project_9_db;
USE project_9_db;

DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Trips;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Trips (
    trip_id INT PRIMARY KEY,
    destination VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    trip_id INT,
    booking_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id)
);

INSERT INTO Customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO Trips VALUES
(1, 'Paris', 1500.00),
(2, 'Tokyo', 1800.00),
(3, 'New York', 1200.00),
(4, 'Rome', 1400.00);

INSERT INTO Bookings VALUES
(1, 1, 1, '2025-06-01'),
(2, 2, 2, '2025-06-02'),
(3, 1, 3, '2025-06-03'),
(4, 3, 1, '2025-06-04');

SELECT t.destination, t.price
FROM Trips t
JOIN Bookings b ON t.trip_id = b.trip_id
JOIN Customers c ON b.customer_id = c.customer_id
WHERE c.name = 'Alice';

SELECT destination
FROM Trips
WHERE trip_id NOT IN (
    SELECT DISTINCT trip_id FROM Bookings
);
