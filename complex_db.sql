-- Active: 1676029288948@@localhost@3306
CREATE DATABASE Company_db
    DEFAULT CHARACTER SET = 'utf8mb4';

USE Company_db;

CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

-- mgr_id stands for manager_id
-- Adding foreign keys, couldn't add them before because the table branch was not created.
ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

DESCRIBE employee;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);
-- Kept the last column blank because there is no data in the branch table, hence we can't call a foreign KEY
-- We insert data in there as soon as we insert into branch id.

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES
(2, 'Hammer Mill', 'Paper'),
(2, 'Uni-ball', 'Writing Utensils'),
(3, 'Patriot Paper', 'Paper'),
(2, 'J.T. Forms & Labels', 'Custom Forms'),
(3, 'Uni-ball', 'Writing Utensils'),
(3, 'Hammer Mill', 'Paper'),
(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES
(400, 'Dunmore Highschool', 2),
(401, 'Lackawana Country', 2),
(402, 'FedEx', 3),
(403, 'John Daly Law, LLC', 3),
(404, 'Scranton Whitepages', 2),
(405, 'Times Newspaper', 3),
(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES
(105, 400, 55000),
(102, 401, 267000),
(108, 402, 22500),
(107, 403, 5000),
(108, 403, 12000),
(105, 404, 33000),
(107, 405, 26000),
(102, 406, 15000),
(105, 406, 130000);

SELECT * FROM employee;
SELECT * FROM client;
SELECT * FROM works_with;
SELECT * FROM branch_supplier;

SELECT * FROM branch;

-- Querrying from the company DATABASE
SELECT first_name, last_name FROM employee;

-- Can also do;
SELECT first_name AS fore_name, last_name AS surname FROM employee; --Notice the column name changes to what we have set AS

-- Find out all the different genders
SELECT DISTINCT sex
FROM employee; --we use distinct so that we don't get repeated values.


-- Functions in SQL

-- Find the number of employees
SELECT COUNT(emp_id)
FROM employee
WHERE sex = 'F' AND birth_day > '1970-01-01';

-- find the average of all employee's salaries
SELECT AVG(salary) FROM employee
WHERE sex = 'M';

SELECT SUM(salary) FROM employee;

-- Find out how many males and females are in the company
SELECT COUNT(sex), sex 
FROM employee
GROUP BY sex;

-- Find the total sales of each sales man
SELECT  emp_id, SUM(total_sales)
FROM works_with
GROUP BY emp_id;


-- WILD CARDS-get data that matches a specific prompt or pattern.

-- Find any client's who are an LLC
SELECT *
FROM client
WHERE client_name LIKE '%LLC';

-- % reperesents any number of random characters.
-- %% helps find any thing that has the specified characters somewhere in its name.

-- Find any Branch suppliers that are in the label business.
SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '% Label%';

-- Find any employee born in October
-- _ is for one character.
SELECT *
FROM employee
WHERE birth_day LIKE '____-02%'; --The first four underscores represent a singke character each for a number in the year, the  -10 is the month we are looking for and then the % is for the resetof the characters   i.e day

-- Find any clients who are schools
SELECT *
FROM client
WHERE client_name LIKE '%school%';

-- Continuing
-- UNIONS

-- Find a list of employee and branch names
SELECT first_name FROM employee;

SELECT branch_name FROM branch;

-- Using UNION
SELECT first_name
FROM employee
UNION -- Unions work when you are getting things of same data type and same number columns being requested.
SELECT branch_name
FROM  branch;  --returns all the info in one column.

-- USING JOINS


