CREATE TABLE customers (
cust_id SERIAL PRIMARY KEY,
cust_name VARCHAR(100) NOT NULL);

CREATE TABLE orders(
 order_id SERIAL PRIMARY KEY,
 order_date DATE NOT NULL,
 price NUMERIC NOT NULL,
 cust_id INTEGER NOT NULL,
 FOREIGN KEY (cust_id) REFERENCES
 customers (cust_id)
);

SELECT * FROM customers;
SELECT * FROM orders;

INSERT INTO customers (cust_name)
VALUES ('Ubaid'),('Adeel'),('Umer'),('Awais');

INSERT INTO orders (order_date,price,cust_id)
VALUES 
('2026-02-10','10000','1'),
('2026-02-11','20000','1'),
('2026-02-12','2000','2'),
('2026-02-13','1000','3'),
('2026-02-14','5000','4');

CROSS JOIN

-- SELECT * FROM customers CROSS JOIN orders;

-- INNER JOIN

SELECT * FROM customers c
INNER JOIN
orders o
ON c.cust_id=o.cust_id;

-- INNER JOIN WITH GROUP BY

SELECT c.cust_name, COUNT(o.order_id) FROM 
customers c
INNER JOIN 
orders o
ON c.cust_id=o.cust_id
GROUP BY cust_name;

-- SUM
SELECT c.cust_name, SUM(o.price) FROM 
customers c
INNER JOIN 
orders o
ON c.cust_id=o.cust_id
GROUP BY cust_name;

-- LEFT JOIN

SELECT * FROM customers c
LEFT JOIN 
orders o
ON c.cust_id=o.cust_id;

-- RIGHT JOIN

SELECT * FROM orders o
RIGHT JOIN 
customers c
ON c.cust_id=o.cust_id;


