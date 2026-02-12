CREATE TABLE orders (
order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(30),
    quantity INT CHECK (quantity > 0),
    price NUMERIC(10,2),
    order_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20) DEFAULT 'Pending'
);

SELECT * FROM orders;

-- ENTER DATA

INSERT INTO orders (customer_name, product_name, category, quantity, price, order_date, status)
VALUES
('Ubaid', 'Laptop', 'Electronics', 1, 1200, '2026-02-01', 'Completed'),
('Adeel', 'Mouse', 'Electronics', 2, 25, '2026-02-02', 'Pending'),
('Hassan', 'Desk', 'Furniture', 1, 300, '2026-02-03', 'Completed'),
('Ali', 'Chair', 'Furniture', 4, 150, '2026-02-03', 'Cancelled'),
('Umar', 'Phone', 'Electronics', 2, 800, '2026-02-04', 'Completed'),
('Zain', 'Notebook', 'Stationery', 10, 5, '2026-02-04', 'Pending');

SELECT
order_id,customer_name, quantity * price AS total_amount FROM orders;

SELECT SUM(quantity * price) AS Total_Sales FROM orders 
WHERE category='Electronics';


SELECT category,
SUM(quantity*price) AS total_sales
FROM orders
GROUP BY category
ORDER BY total_sales DESC;

SELECT COUNT(quantity) FROM orders;
