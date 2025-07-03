-- Miniproject-6: Movie Rental System

CREATE DATABASE IF NOT EXISTS project_6_db;
USE project_6_db;

DROP TABLE IF EXISTS Rentals;
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Rentals (
    rental_id INT PRIMARY KEY,
    customer_id INT,
    movie_id INT,
    rental_date DATE,
    return_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

INSERT INTO Movies VALUES
(1, 'The Matrix', 'Sci-Fi'),
(2, 'Titanic', 'Romance'),
(3, 'The Godfather', 'Crime'),
(4, 'Finding Nemo', 'Animation'),
(5, 'Inception', 'Sci-Fi');

INSERT INTO Customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

INSERT INTO Rentals VALUES
(1, 1, 1, '2025-06-01', '2025-06-05'),
(2, 2, 2, '2025-06-02', NULL),
(3, 3, 3, '2025-06-03', '2025-06-08'),
(4, 1, 5, '2025-06-04', NULL),
(5, 4, 4, '2025-06-01', '2025-06-02'),
(6, 2, 5, '2025-06-06', NULL),
(7, 3, 1, '2025-06-07', NULL);

SELECT r.rental_id, c.name AS customer, m.title AS movie, r.rental_date
FROM Rentals r
JOIN Customers c ON r.customer_id = c.customer_id
JOIN Movies m ON r.movie_id = m.movie_id
WHERE r.return_date IS NULL;

SELECT DISTINCT c.name
FROM Rentals r
JOIN Customers c ON r.customer_id = c.customer_id
JOIN Movies m ON r.movie_id = m.movie_id
WHERE m.genre = 'Sci-Fi';

SELECT m.title, COUNT(*) AS rental_count
FROM Rentals r
JOIN Movies m ON r.movie_id = m.movie_id
GROUP BY m.title
ORDER BY rental_count DESC
LIMIT 3;
