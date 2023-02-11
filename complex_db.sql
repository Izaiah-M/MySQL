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

DESCRIBE employee;
DESCRIBE branch;
