-- Miniproject-20: Clinic Appointment Scheduling

CREATE DATABASE IF NOT EXISTS project_20_db;
USE project_20_db;

DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS Patients;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    contact VARCHAR(100)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialty VARCHAR(100)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20), 
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Patients VALUES
(1, 'Alice', 'alice@gmail.com'),
(2, 'Bob', 'bob@gmail.com'),
(3, 'Charlie', 'charlie@gmail.com'),
(4, 'Diana', 'diana@gmail.com');

INSERT INTO Doctors VALUES
(1, 'Dr. Smith', 'Cardiology'),
(2, 'Dr. Brown', 'Dermatology'),
(3, 'Dr. Green', 'Neurology');

INSERT INTO Appointments VALUES
(1, 1, 1, '2025-06-30', 'completed'),
(2, 2, 1, '2025-07-01', 'missed'),
(3, 3, 2, '2025-07-01', 'completed'),
(4, 4, 3, '2025-07-02', 'scheduled'),
(5, 1, 2, '2025-07-03', 'missed'),
(6, 2, 3, '2025-07-03', 'completed'),
(7, 3, 1, '2025-07-03', 'completed'),
(8, 4, 1, '2025-07-03', 'completed'),
(9, 1, 1, '2025-07-04', 'scheduled');


SELECT d.name AS doctor_name, COUNT(*) AS total_appointments
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
WHERE appointment_date BETWEEN '2025-07-01' AND '2025-07-07'
GROUP BY d.doctor_id
ORDER BY total_appointments DESC
LIMIT 1;


SELECT p.name AS patient_name, a.appointment_date
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
WHERE a.status = 'missed';
