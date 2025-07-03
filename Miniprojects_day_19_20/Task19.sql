-- Miniproject-19: Event Management System

CREATE DATABASE IF NOT EXISTS project_19_db;
USE project_19_db;

DROP TABLE IF EXISTS Registrations;
DROP TABLE IF EXISTS Attendees;
DROP TABLE IF EXISTS Events;

CREATE TABLE Events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATE
);

CREATE TABLE Attendees (
    attendee_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY,
    attendee_id INT,
    event_id INT,
    registration_date DATE,
    FOREIGN KEY (attendee_id) REFERENCES Attendees(attendee_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

INSERT INTO Events VALUES
(1, 'Tech Conference', '2025-08-01'),
(2, 'Music Festival', '2025-08-10'),
(3, 'Startup Meetup', '2025-08-15');

INSERT INTO Attendees VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com'),
(3, 'Charlie', 'charlie@example.com'),
(4, 'Diana', 'diana@example.com'),
(5, 'Eve', 'eve@example.com');


INSERT INTO Registrations (registration_id, attendee_id, event_id, registration_date)
SELECT 1000 + ROW_NUMBER() OVER(), CEIL(RAND()*5), 1, '2025-07-01'
FROM INFORMATION_SCHEMA.COLUMNS
LIMIT 101;


INSERT INTO Registrations VALUES
(2001, 1, 2, '2025-07-02'),
(2002, 2, 2, '2025-07-02'),
(2003, 3, 3, '2025-07-03'),
(2004, 4, 3, '2025-07-03'),
(2005, 1, 3, '2025-07-03');


SELECT e.event_name, COUNT(r.registration_id) AS total_attendees
FROM Events e
JOIN Registrations r ON e.event_id = r.event_id
GROUP BY e.event_id
HAVING total_attendees > 100;


SELECT a.name, COUNT(DISTINCT r.event_id) AS events_attended
FROM Attendees a
JOIN Registrations r ON a.attendee_id = r.attendee_id
GROUP BY a.attendee_id
HAVING events_attended > 1;
