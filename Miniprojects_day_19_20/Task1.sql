-- Miniproject-1: Library Management System

CREATE DATABASE IF NOT EXISTS project_1_db;
USE project_1_db;

DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Members;

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    is_loaned BOOLEAN,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    join_date DATE
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

INSERT INTO Authors VALUES
(1, 'J.K. Rowling'),
(2, 'George Orwell'),
(3, 'Jane Austen');

INSERT INTO Books VALUES
(1, 'Harry Potter', 1, TRUE),
(2, '1984', 2, FALSE),
(3, 'Animal Farm', 2, TRUE),
(4, 'Pride and Prejudice', 3, FALSE),
(5, 'Emma', 3, TRUE);

INSERT INTO Members VALUES
(1, 'Alice', '2023-01-10'),
(2, 'Bob', '2023-02-15'),
(3, 'Charlie', '2023-03-20');

INSERT INTO Loans VALUES
(1, 1, 1, '2025-06-20', '2025-06-27', NULL),
(2, 3, 2, '2025-06-15', '2025-06-22', '2025-06-21'),
(3, 5, 3, '2025-06-01', '2025-06-08', NULL);

SELECT b.title
FROM Books b
JOIN Loans l ON b.book_id = l.book_id
WHERE l.return_date IS NULL;

SELECT b.title, m.name, l.due_date
FROM Loans l
JOIN Books b ON l.book_id = b.book_id
JOIN Members m ON l.member_id = m.member_id
WHERE l.return_date IS NULL AND l.due_date < CURDATE();

SELECT m.name, COUNT(*) AS loan_count
FROM Loans l
JOIN Members m ON l.member_id = m.member_id
GROUP BY m.name
ORDER BY loan_count DESC
LIMIT 1;
