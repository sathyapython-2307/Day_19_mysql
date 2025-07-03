-- Miniproject-4: Online Store Product Catalog

CREATE DATABASE IF NOT EXISTS project_4_db;
USE project_4_db;

DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Suppliers;

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT,
    supplier_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

INSERT INTO Categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

INSERT INTO Suppliers VALUES
(1, 'Supplier A'),
(2, 'Supplier B'),
(3, 'Supplier C');

INSERT INTO Products VALUES
(1, 'Smartphone', 699.99, 1, 1),
(2, 'Laptop', 1299.99, 1, 2),
(3, 'T-Shirt', 19.99, 2, 2),
(4, 'Jeans', 49.99, 2, 3),
(5, 'Novel', 15.99, 3, 1),
(6, 'Headphones', 199.99, 1, 3),
(7, 'Jacket', 89.99, 2, 1),
(8, 'Tablet', 499.99, 1, 2);

SELECT name, price
FROM Products
WHERE category_id = 1;

SELECT name, price
FROM Products
WHERE price BETWEEN 100 AND 800;

SELECT name, price
FROM Products
WHERE supplier_id = 2;

SELECT name, price
FROM Products
ORDER BY price DESC
LIMIT 5;
