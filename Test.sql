-- Active: 1676029288948@@localhost@3306

-- Practice 1:

CREATE DATABASE TestOne
    DEFAULT CHARACTER SET = 'utf8mb4';

CREATE TABLE Client (
    Clientno CHAR(6) PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Pin INT,
    Mobile CHAR(10)
);

-- Practice 2:

INSERT INTO Client VALUES 
('c00001', 'Ivan Bayross', 'Bombay', 400054, 3456212343),
('c00002', 'Vandana Saitwal', 'Madras', 780001, 8976532322),
('c00003', 'Pramada jaguste', 'Bombay', 400007, 9090898765),
('c00004', 'Ravi Shreedharan', 'Delhii', 110020, 8727121232),
('c00005', 'Rukmani', 'Kolkata', 340003, 2312376543),
('c00006', 'Pradeep Singhania', 'Jaipur', 130102, 1222132333),
('c00007', 'Geoge Paul', 'Kolkata', 340010, 3323211232),
('c00008', 'D Ravichandran', 'Bombay', 400014, 2212387896);

-- Practice 3:

SELECT Name FROM Client WHERE Name LIKE 'van%';

-- Practice 4:
SELECT * FROM Client WHERE City <> 'Bombay';

-- Practice 5:
SELECT DISTINCT(City) FROM Client;

-- Practice 6:
CREATE TABLE Club (
    Coachid INT PRIMARY KEY AUTO_INCREMENT,
    Coachname CHAR(20),
    Age INT,
    Sport CHAR(20),
    Dateofapp DATE,
    Pay INT,
    Gender CHAR(1)
);

INSERT INTO Club(Coachname, Age, Sport, Dateofapp, Pay, Gender) VALUES 
('Karan', 35, 'Karate', '27/03/19', 10000, 'M'),
('Ravina', 34, 'Karate', '20/01/20', 12000, 'F'),
('Kamal', 34, 'Squash', '19/02/20', 20000, 'M'),
('Tarun', 33, 'Basketball', '01/01/20', 15000, 'M'),
('Sumeru', 36, 'Swimming', '12/01/20', 7500, 'M'),
('Anjani', 36, 'Swimming', '24/02/20', 8000, 'F'),
('Shamima', 37, 'Squash', '20/02/20', 22000, 'F'),
('Soumya', 30, 'Karate', '22/02/20', 11000, 'F');

SELECT * FROM Club;