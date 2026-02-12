CREATE TABLE employees(
emp_id SERIAL PRIMARY KEY,
fname VARCHAR(50) NOT NULL,
lname VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
dept VARCHAR(50),
salary DECIMAL(10,2) DEFAULT 30000.00,
hire_date DATE NOT NULL DEFAULT CURRENT_DATE
);
SELECT * FROM employees

INSERT INTO employees(
emp_id,fname,lname,email,dept,salary,hire_date)
VALUES(1,'Ubaid','Saghir','ubaidsaghir456@gmail.com','IT',70000,'01-02-2026'),
(2,'Adeel','Umer','adeelumer776@gmail.com','CS',40000,'02-02-2026'),
(3,'Hassan','Murtaza','hassanmurtaza446@gmail.com','Manager',80000,'03-02-2026'),
(4,'Abdullah','Ashan','abdullahashan99@gmail.com','Head',65000,'04-02-2026'),
(5,'Haris','Khan','hariskhan332@gmail.com','Senior Head',95000,'05-02-2026'),
(6,'Daniyal','Hussain','daniyalhussain117@gmail.com','Junior Manager',88000,'06-02-2026'),
(7,'Huzaifa','Ahsan','huzaifaahsan356@gmail.com','Manager',92000,'07-02-2026'),
(8,'Zain','Ilyas','zainilyas223@gmail.com','HR',75000,'08-02-2026'),
(9,'Muzamil','Khan','muzamilkhan689@gmail.com','MArketing',55000,'09-02-2026'),
(10,'Umar','Khan','umarkhan908@gmail.com','Finance',50000,'10-02-2026');


-- EXPRESSION CASE

SELECT * FROM employees; 
-- TASK 1
SELECT fname,salary,
CASE
    WHEN salary >=50000 THEN 'High'
ELSE 'Low'
END AS sal_cat
FROM employees;

-- TASK 2

SELECT fname,salary,
CASE
WHEN salary >=50000 THEN 'HIGH'
WHEN salary >= 40000 AND salary <50000 THEN 'MID'
ELSE 'LOW'
END AS sal_cat
FROM employees;

-- USE BETWEEN in CASE CONDITION

SELECT fname,salary,
CASE WHEN salary >55000 THEN 'HIGH'
WHEN salary BETWEEN 45000 AND 55000 THEN 'MID'
ELSE 'LOW'
END AS sal_cat
FROM employees;

-- TASK 3

SELECT fname,salary,
CASE
WHEN salary > 0 THEN ROUND(salary*.10)
END AS BONUS
FROM employees;

-- TASK 4

SELECT 
CASE WHEN salary >55000 THEN 'HIGH'
WHEN salary BETWEEN 45000 AND 55000 THEN 'MID'
ELSE 'LOW'
END AS sal_cat, COUNT(emp_id)
FROM employees GROUP BY sal_cat;

-- TASK 5

SELECT fname,emp_id,
CASE WHEN dept= 'IT' THEN 'INFORMATION TECH'
WHEN dept='HR' THEN 'HUMAN RESOURCES'
WHEN dept='CS' THEN 'COMPUTER SCIENCE'
ELSE dept
END AS department_name
FROM employees;

-- TASK 6

SELECT fname,dept,
CASE WHEN dept='IT' THEN '20%'
WHEN dept='HR' THEN '15%'
ELSE '10%'
END AS BONUS
FROM employees;

-- TASK 7

SELECT fname,salary,ROUND(salary*0.10) AS BONUS,
CASE 
WHEN salary + ROUND(salary*0.10) >=75000 THEN 'Excellent Package'
WHEN salary + ROUND(salary*0.10) >=60000 THEN 'Good Package'
ELSE 'Average Package'
END AS Package_status
FROM employees;
