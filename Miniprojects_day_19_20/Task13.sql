-- Miniproject-13: Inventory Management for a Grocery Store

CREATE DATABASE IF NOT EXISTS project_13_db;
USE project_13_db;

DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Suppliers;

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    supplier_id INT,
    threshold INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Stock (
    stock_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    last_updated DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Suppliers VALUES
(1, 'FreshFarms'),
(2, 'OrganicCo'),
(3, 'DairyDepot');

INSERT INTO Products VALUES
(1, 'Apples', 1, 50),
(2, 'Milk', 3, 30),
(3, 'Bread', 2, 20),
(4, 'Carrots', 1, 40),
(5, 'Yogurt', 3, 25),
(6, 'Cheese', 3, 15);

INSERT INTO Stock VALUES
(1, 1, 45, '2025-07-02'),
(2, 2, 60, '2025-07-02'),
(3, 3, 15, '2025-07-02'),
(4, 4, 30, '2025-07-02'),
(5, 5, 20, '2025-07-02'),
(6, 6, 10, '2025-07-02');

SELECT p.name AS product, s.quantity, p.threshold
FROM Products p
JOIN Stock s ON p.product_id = s.product_id
WHERE s.quantity < p.threshold;

SELECT su.name AS supplier, COUNT(p.product_id) AS products_supplied
FROM Suppliers su
JOIN Products p ON su.supplier_id = p.supplier_id
GROUP BY su.supplier_id
HAVING products_supplied > 5;
