-- Step 1: Create a new database
CREATE DATABASE employee_management;

-- Step 2: Use that database
USE employee_management;

-- Step 3: Create Departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50)
);

-- Step 4: Create Employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department_id INT,
    hire_date DATE,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Step 5: Insert sample data
INSERT INTO departments (department_name)
VALUES ('HR'), ('IT'), ('Finance'), ('Sales');

INSERT INTO employees (name, department_id, hire_date, salary)
VALUES
('John', 1, '2018-03-10', 45000),
('Priya', 2, '2020-06-21', 60000),
('Amit', 3, '2010-02-15', 75000),
('Neha', 4, '2019-09-01', 52000),
('Ravi', 2, '2015-04-20', 68000),
('Sara', 1, '2022-07-12', 40000);

-- 1. List all employees
SELECT * FROM employees;

-- 2. Find employees hired in last 6 months
SELECT * FROM employees
WHERE hire_date > DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- 3. Find department-wise total salary
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

-- 4. Find average salary per department
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- 5. Find highest paid employee
SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 1;

-- 6. Count employees per department
SELECT department_id, COUNT(*) AS total_employees
FROM employees
GROUP BY department_id;

-- 7. Find employees with more than 5 years experience
SELECT name, hire_date
FROM employees
WHERE DATEDIFF(CURDATE(), hire_date) > 1825;

-- 8. Find employees whose name starts with ‘A’
SELECT * FROM employees
WHERE name LIKE 'A%';

-- 9. Find employees earning above average salary
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 10. Find department with the highest total salary
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC
LIMIT 1;

