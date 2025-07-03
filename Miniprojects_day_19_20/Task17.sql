-- Miniproject-17: Parking Lot Management

CREATE DATABASE IF NOT EXISTS project_17_db;
USE project_17_db;

DROP TABLE IF EXISTS ParkingRecords;
DROP TABLE IF EXISTS Vehicles;
DROP TABLE IF EXISTS Lots;

CREATE TABLE Lots (
    lot_id INT PRIMARY KEY,
    lot_name VARCHAR(100),
    capacity INT
);

CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    registration_no VARCHAR(50),
    owner_name VARCHAR(100)
);

CREATE TABLE ParkingRecords (
    record_id INT PRIMARY KEY,
    vehicle_id INT,
    lot_id INT,
    entry_time DATETIME,
    exit_time DATETIME,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    FOREIGN KEY (lot_id) REFERENCES Lots(lot_id)
);

INSERT INTO Lots VALUES
(1, 'Lot A', 2),
(2, 'Lot B', 3);

INSERT INTO Vehicles VALUES
(1, 'KA01AB1234', 'Alice'),
(2, 'KA02CD5678', 'Bob'),
(3, 'KA03EF9101', 'Charlie'),
(4, 'KA04GH2345', 'David');

INSERT INTO ParkingRecords VALUES
(1, 1, 1, '2025-07-03 08:00:00', NULL),
(2, 2, 1, '2025-07-03 08:30:00', NULL),
(3, 3, 2, '2025-07-03 09:00:00', '2025-07-03 11:00:00'),
(4, 4, 2, '2025-07-03 09:30:00', NULL);


SELECT v.registration_no, v.owner_name, l.lot_name, pr.entry_time
FROM ParkingRecords pr
JOIN Vehicles v ON pr.vehicle_id = v.vehicle_id
JOIN Lots l ON pr.lot_id = l.lot_id
WHERE pr.exit_time IS NULL;


SELECT l.lot_name, l.capacity, COUNT(pr.record_id) AS occupied
FROM Lots l
JOIN ParkingRecords pr ON l.lot_id = pr.lot_id
WHERE pr.exit_time IS NULL
GROUP BY l.lot_id
HAVING occupied >= l.capacity;
