-- Miniproject-11: E-Commerce Order Tracking

CREATE DATABASE IF NOT EXISTS project_11_db;
USE project_11_db;

DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO Products VALUES
(1, 'Laptop', 1000.00),
(2, 'Phone', 500.00),
(3, 'Headphones', 100.00),
(4, 'Keyboard', 75.00);

INSERT INTO Orders VALUES
(1, 1, '2025-06-25', 'Pending'),
(2, 2, '2025-06-20', 'Shipped'),
(3, 1, '2025-06-15', 'Delivered'),
(4, 3, '2025-06-28', 'Pending');

INSERT INTO OrderItems VALUES
(1, 1, 1, 1),
(2, 1, 3, 2),
(3, 2, 2, 1),
(4, 3, 1, 1),
(5, 3, 4, 1),
(6, 4, 2, 3);

SELECT *
FROM Orders
WHERE status = 'Pending';

SELECT o.order_id, o.order_date, p.name AS product, oi.quantity
FROM Orders o
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE o.customer_id = 1;

SELECT p.name, SUM(oi.quantity) AS total_ordered
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY oi.product_id
HAVING total_ordered > 10;
