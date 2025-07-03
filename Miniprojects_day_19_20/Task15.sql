-- Miniproject-15: Bookstore Sales System

CREATE DATABASE IF NOT EXISTS project_15_db;
USE project_15_db;

DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Books;

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150),
    author VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    book_id INT,
    customer_id INT,
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Books VALUES
(1, 'The Alchemist', 'Paulo Coelho', 300.00),
(2, '1984', 'George Orwell', 350.00),
(3, 'Sapiens', 'Yuval Noah Harari', 450.00),
(4, 'Clean Code', 'Robert C. Martin', 500.00),
(5, 'Atomic Habits', 'James Clear', 400.00);

INSERT INTO Customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO Sales VALUES
(1, 1, 1, '2025-07-01', 1),
(2, 2, 1, '2025-07-01', 2),
(3, 3, 2, '2025-07-02', 1),
(4, 4, 2, '2025-07-02', 1),
(5, 1, 3, '2025-07-03', 3),
(6, 5, 1, '2025-07-03', 1),
(7, 5, 2, '2025-07-04', 1);

SELECT b.title, SUM(s.quantity) AS total_sold
FROM Sales s
JOIN Books b ON s.book_id = b.book_id
GROUP BY b.book_id
ORDER BY total_sold DESC
LIMIT 3;

SELECT c.name, COUNT(s.sale_id) AS books_purchased
FROM Sales s
JOIN Customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id
HAVING books_purchased > 3;
