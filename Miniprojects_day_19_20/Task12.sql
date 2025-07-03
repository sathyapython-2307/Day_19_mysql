-- Miniproject-12: Hotel Room Booking System

CREATE DATABASE IF NOT EXISTS project_12_db;
USE project_12_db;

DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Guests;
DROP TABLE IF EXISTS Rooms;

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_number VARCHAR(10),
    room_type VARCHAR(50),
    is_available BOOLEAN
);

CREATE TABLE Guests (
    guest_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

INSERT INTO Rooms VALUES
(1, '101', 'Single', TRUE),
(2, '102', 'Double', TRUE),
(3, '103', 'Suite', TRUE),
(4, '104', 'Double', TRUE);

INSERT INTO Guests VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO Bookings VALUES
(1, 1, 1, '2025-07-01', '2025-07-05'),
(2, 2, 2, '2025-07-02', '2025-07-06'),
(3, 1, 3, '2025-07-10', '2025-07-15'),
(4, 3, 2, '2025-07-08', '2025-07-12');

SELECT room_number, room_type
FROM Rooms
WHERE room_id NOT IN (
    SELECT room_id
    FROM Bookings
    WHERE '2025-07-04' BETWEEN check_in AND check_out
);

SELECT g.name, COUNT(*) AS total_bookings
FROM Bookings b
JOIN Guests g ON b.guest_id = g.guest_id
GROUP BY g.guest_id
HAVING total_bookings > 3;
