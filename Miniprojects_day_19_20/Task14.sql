-- Miniproject-14: Vehicle Service Center Database

CREATE DATABASE IF NOT EXISTS project_14_db;
USE project_14_db;

DROP TABLE IF EXISTS ServiceRecords;
DROP TABLE IF EXISTS Services;
DROP TABLE IF EXISTS Vehicles;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    customer_id INT,
    model VARCHAR(100),
    registration_no VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100),
    cost DECIMAL(10,2)
);

CREATE TABLE ServiceRecords (
    record_id INT PRIMARY KEY,
    vehicle_id INT,
    service_id INT,
    service_date DATE,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

INSERT INTO Customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO Vehicles VALUES
(1, 1, 'Honda Civic', 'KA01AB1234'),
(2, 2, 'Hyundai i20', 'KA02CD5678'),
(3, 3, 'Toyota Corolla', 'KA03EF9101');

INSERT INTO Services VALUES
(1, 'Oil Change', 1000.00),
(2, 'Brake Inspection', 1500.00),
(3, 'Tire Rotation', 800.00);

INSERT INTO ServiceRecords VALUES
(1, 1, 1, '2025-06-05'),
(2, 2, 2, '2025-07-01'),
(3, 1, 3, '2025-07-02'),
(4, 3, 1, '2025-06-25'),
(5, 1, 2, '2025-01-15'),
(6, 1, 1, '2025-03-10'),
(7, 1, 3, '2025-05-11');

SELECT v.registration_no, sr.service_date, s.service_name
FROM ServiceRecords sr
JOIN Vehicles v ON sr.vehicle_id = v.vehicle_id
JOIN Services s ON sr.service_id = s.service_id
WHERE sr.service_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

SELECT c.name, COUNT(sr.record_id) AS total_services
FROM ServiceRecords sr
JOIN Vehicles v ON sr.vehicle_id = v.vehicle_id
JOIN Customers c ON v.customer_id = c.customer_id
WHERE YEAR(sr.service_date) = 2025
GROUP BY c.customer_id
HAVING total_services > 2;
