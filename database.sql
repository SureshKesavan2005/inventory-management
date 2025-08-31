USE inventory_db;

CREATE TABLE Suppliers (
    supplier_id INT NOT NULL AUTO_INCREMENT,
    supplier_name VARCHAR(100),
    supplier_contact VARCHAR(100),
    PRIMARY KEY (supplier_id)
);

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(100)
);

CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Suppliers (supplier_name, supplier_contact) VALUES
('ABC Traders', 'abc@gmail.com'),
('XYZ Supplies', 'xyz@gmail.com');

INSERT INTO Products (name, price, stock, supplier_id) VALUES
('Laptop', 50000, 10, 1),
('Mouse', 500, 100, 2);

INSERT INTO Orders (order_date, customer_name) VALUES
('2025-08-31', 'John Doe');

INSERT INTO OrderItems (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 2, 5);

-- Queries

SELECT * FROM Products;

SELECT o.order_id, o.customer_name, p.name AS product, oi.quantity
FROM Orders o
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

UPDATE Products
SET stock = stock - 2
WHERE product_id = 1;

SELECT * FROM Products;

SHOW DATABASES;





