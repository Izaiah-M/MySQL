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



SELECT * FROM users;