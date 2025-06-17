create database ecommerce;
USE ecommerce;

-- customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255)
);

-- products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stockQuantity INT
);

-- cart table
CREATE TABLE cart (
    cart_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_price DECIMAL(10, 2),
    shipping_address VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- order_items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    itemAmount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO customers (customer_id, name, email, address) VALUES
(1, 'pk', 'pk@example.com', '123  St, City'),
(2, 'sk', 'sk@example.com', '456 St, Town'),
(3, 'dhoni', 'dhoni@example.com', '789 St, Village'),
(4, 'virat', 'virat@example.com', '101 St, town'),
(5, 'David ', 'david@example.com', '234 St, District'),
(6, 'kamal', 'kamal@example.com', '567 st, County'),
(7, 'David', 'david@example.com', '890 St, State'),
(8, 'simbu', 'simbu@example.com', '321 St, Country'),
(9, 'vetri', 'vetri@example.com', '432 St, city'),
(10, 'mani', 'mani@example.com', '765 St, Town');

INSERT INTO products (product_id, name, description, price, stockQuantity) VALUES
(1, 'Laptop', 'High-performance laptop', 800.00, 10),
(2, 'Smartphone', 'Latest smartphone', 600.00, 15),
(3, 'Tablet', 'Portable tablet', 300.00, 20),
(4, 'Headphones', 'Noise-canceling', 150.00, 30),
(5, 'TV', '4K Smart TV', 900.00, 5),
(6, 'Coffee Maker', 'Automatic coffee maker', 50.00, 25),
(7, 'Refrigerator', 'Energy-efficient', 700.00, 10),
(8, 'Microwave Oven', 'Countertop microwave', 80.00, 15),
(9, 'Blender', 'High-speed blender', 70.00, 20),
(10, 'Vacuum Cleaner', 'Bagless vacuum cleaner', 120.00, 10);

INSERT INTO orders (order_id, customer_id, order_date, total_price, shipping_address) VALUES
(1, 1, '2023-01-05', 1200.00, '123 Main St, City'),
(2, 2, '2023-02-10', 900.00, '456 Elm St, Town'),
(3, 3, '2023-03-15', 300.00, '789 Oak St, Village'),
(4, 4, '2023-04-20', 150.00, '101 Pine St, Suburb'),
(5, 5, '2023-05-25', 1800.00, '234 Cedar St, District'),
(6, 6, '2023-06-30', 400.00, '567 Birch St, County'),
(7, 7, '2023-07-05', 700.00, '890 Maple St, State'),
(8, 8, '2023-08-10', 160.00, '321 Redwood St, Country'),
(9, 9, '2023-09-15', 140.00, '432 Spruce St, Province'),
(10, 10, '2023-10-20', 1400.00, '765 Fir St, Town');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, itemAmount) VALUES
(1, 1, 1, 2, 1600.00),
(2, 1, 3, 1, 300.00),
(3, 2, 2, 3, 1800.00),
(4, 3, 5, 2, 1800.00),
(5, 4, 4, 4, 600.00),
(6, 4, 6, 1, 50.00),
(7, 5, 1, 1, 800.00),
(8, 5, 2, 2, 1200.00),
(9, 6, 10, 2, 240.00),
(10, 6, 9, 3, 210.00);

INSERT INTO cart (cart_id, customer_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 3, 4, 4),
(5, 3, 5, 2),
(6, 4, 6, 1),
(7, 5, 1, 1),
(8, 6, 10, 2),
(9, 6, 9, 3),
(10, 7, 7, 2);

-- queries

UPDATE products SET price = 800 WHERE product_id=7;

DELETE FROM cart WHERE customer_id = 3;

SELECT * FROM products WHERE price < 100;

SELECT * FROM products WHERE stockQuantity > 5;

SELECT * FROM orders WHERE total_price BETWEEN 500 AND 1000;

SELECT * FROM products WHERE name LIKE '%r';

SELECT * FROM cart WHERE customer_id = 5;

SELECT DISTINCT c.* 
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE YEAR(o.order_date) = 2023;

SELECT name, stockQuantity 
FROM products 
ORDER BY stockQuantity ASC LIMIT 1;

SELECT c.customer_id, c.name, SUM(o.total_price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

SELECT c.customer_id, c.name, AVG(o.total_price) AS avg_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

SELECT c.customer_id, c.name, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

SELECT c.customer_id, c.name, MAX(o.total_price) AS max_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

SELECT c.customer_id, c.name, SUM(o.total_price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING total_spent > 1000;

SELECT * FROM products
WHERE product_id NOT IN (SELECT product_id FROM cart);


SELECT * FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);


SELECT * FROM products WHERE stockQuantity < 10;

SELECT DISTINCT c.* 
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total_price > 1000;

