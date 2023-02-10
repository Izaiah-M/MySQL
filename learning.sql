-- Active: 1675691410365@@127.0.0.1@3306@izaiah

DROP TABLE users;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(20) DEFAULT 'No name',
    cgpa DECIMAL(3, 2) NOT NULL, --Not null means that the data should always be input
    phone_number INT UNIQUE --Simply means that they should put something that does not already exist.
);

CREATE TABLE hostels (
    hostel_id INT PRIMARY KEY,
    hostel_name VARCHAR(20),
    hostel_location VARCHAR(20),
    hostel_manager VARCHAR(20),
    rooms INT
);

DESCRIBE hostels;

-- to see your table and if it has contents
DESCRIBE users;

-- To delete a TABLE
DROP TABLE users;

-- Adding another column/row to a table
ALTER TABLE users ADD phone_number INT;

-- Removing a col from a table
ALTER TABLE users DROP COLUMN email;

ALTER TABLE users DROP COLUMN create_time;

-- Inserting data into a table
INSERT INTO users VALUES(1, 'Izaiah', 4.33, 0557106452);

-- This is to specify which columns I want data to go in..in this case I don't want data in the id column cause it auto increments
INSERT INTO users (cgpa, phone_number) VALUES(4.33, 0557106452);

INSERT INTO users (user_name, cgpa, phone_number) VALUES('Jill', 3.55, 7106452);

INSERT INTO users (user_name, cgpa, phone_number) VALUES('Jacob', 3.95, 7105452);

INSERT INTO users (cgpa, phone_number) VALUES(4.0, 7188452);

INSERT INTO users (user_name, CGPA, phone_number) VALUES('Jamusi', 3.65, 71078752);


-- How to update data in a table, that is to say change the contents of the column
UPDATE users
SET user_name = 'Updated value'
WHERE user_name = 'No name';

UPDATE users
SET user_name = 'Updated value'
WHERE user_id = 3;

UPDATE users
SET user_name = 'Using OR parameter'
WHERE user_name = 'Jacob' OR user_name = 'Updated value';

UPDATE users
SET user_name = 'Jacob', cgpa = 3.75
WHERE user_id = 3;

UPDATE users
SET user_name = 'Without WHERE';

-- Deleting ROWS

DELETE FROM users; --Deletes all the row contents and leaves you with an empty table

DELETE FROM users
WHERE user_id = 3;

DELETE FROM users
WHERE user_id = 6 AND cgpa = 3.65;



SELECT * FROM users;

DESCRIBE users;


-- Querying Information from the DATABASE; Using the SELECT key word
DROP TABLE users;

SELECT * FROM users;

SELECT cgpa FROM users;

SELECT user_name, cgpa FROM users;

-- Can also be written as;
SELECT users.user_name, users.phone_number FROM users;

-- Ordering queried info
SELECT users.user_name, users.cgpa FROM users ORDER BY user_name; --ordered ascending order

SELECT users.user_name, users.cgpa FROM users ORDER BY user_name DESC; --ordered Descending order

SELECT * FROM users
ORDER BY user_id DESC;

SELECT * FROM users LIMIT 2;

SELECT * FROM users ORDER BY user_name ASC LIMIT 2;

-- Filtering
SELECT * FROM users
WHERE user_name = 'No name';

SELECT user_id, user_name FROM users
WHERE user_name = 'No name';

-- <, >, <>(Not equal to), <=, >=, =, AND, OR
SELECT user_id, user_name FROM users
WHERE user_name <> 'No name';

SELECT user_name, cgpa FROM users
WHERE cgpa <= 3.95 AND user_name <> 'Jacob';

-- Using the IN key word to ease querying a lot
SELECT cgpa, user_name FROM users
WHERE user_name IN ('No name', 'Jill', 'Jamusi')
ORDER BY user_name;
