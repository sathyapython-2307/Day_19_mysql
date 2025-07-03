-- Miniproject-5: Hospital Patient Record Management

CREATE DATABASE IF NOT EXISTS project_5_db;
USE project_5_db;

DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Doctors;

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialty VARCHAR(100)
);

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    doctor_id INT,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Doctors VALUES
(1, 'Dr. Smith', 'Cardiology'),
(2, 'Dr. Johnson', 'Neurology'),
(3, 'Dr. Lee', 'Orthopedics');

INSERT INTO Patients VALUES
(1, 'Alice', 1),
(2, 'Bob', 2),
(3, 'Charlie', 1),
(4, 'David', NULL),
(5, 'Eva', 3);

INSERT INTO Appointments VALUES
(1, 1, 1, '2025-06-01'),
(2, 2, 2, '2025-06-03'),
(3, 3, 1, '2025-06-05'),
(4, 5, 3, '2025-06-06');

SELECT a.appointment_id, p.name AS patient, d.name AS doctor, a.appointment_date
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE a.appointment_date BETWEEN '2025-06-01' AND '2025-06-05';

SELECT name
FROM Patients
WHERE doctor_id IS NULL;


