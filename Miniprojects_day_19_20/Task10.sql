-- Miniproject-10: Gym Membership Management

CREATE DATABASE IF NOT EXISTS project_10_db;
USE project_10_db;

DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS MembershipTypes;
DROP TABLE IF EXISTS Members;

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    membership_type_id INT,
    membership_expiry DATE
);

CREATE TABLE MembershipTypes (
    membership_type_id INT PRIMARY KEY,
    type_name VARCHAR(50),
    duration_months INT,
    price DECIMAL(10,2)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    member_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

INSERT INTO MembershipTypes VALUES
(1, 'Monthly', 1, 50.00),
(2, 'Quarterly', 3, 135.00),
(3, 'Yearly', 12, 500.00);

INSERT INTO Members VALUES
(1, 'Alice', 1, '2025-07-01'),
(2, 'Bob', 3, '2026-06-30'),
(3, 'Charlie', 2, '2025-07-15'),
(4, 'David', 1, '2025-06-15');

INSERT INTO Payments VALUES
(1, 1, '2025-06-01', 50.00),
(2, 2, '2025-06-15', 500.00),
(3, 3, '2025-06-10', 135.00),
(4, 1, '2025-07-01', 50.00);

SELECT name, membership_expiry
FROM Members
WHERE membership_expiry < CURDATE();

SELECT m.name, MAX(p.payment_date) AS last_payment
FROM Members m
LEFT JOIN Payments p ON m.member_id = p.member_id
GROUP BY m.member_id
HAVING last_payment < DATE_SUB(CURDATE(), INTERVAL 1 MONTH);
