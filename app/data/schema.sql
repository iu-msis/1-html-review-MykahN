CREATE DATABASE IF NOT EXISTS msisdb;
USE msisdb;

DROP TABLE IF EXISTS student;
CREATE TABLE student (
	id int PRIMARY KEY AUTO_INCREMENT ,
    username varchar(24) UNIQUE NOT NULL,
    name varchar(48)
);

INSERT INTO student (id, username, name) VALUES 
(1, 'tomgreg', 'Tom Gregory'),
(2, 'beth1', 'Beth Barnhart'),
(3, 'bipin', 'Prof. Prabhakar');

-- SELECT * FROM students;

DROP TABLE IF EXISTS offer;
CREATE TABLE offer (
	id int PRIMARY KEY AUTO_INCREMENT,
    studentId int NOT NULL REFERENCES student(id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
	companyName VARCHAR(24) NOT NULL DEFAULT '',
    salary int NOT NULL DEFAULT 0,
    bonus int NOT NULL DEFAULT 0,
	offerDate date NOT NULL DEFAULT(CURRENT_DATE)
);

-- Student 1 has no offers, Student 2 has 3 offers, Student 3 has one offer
INSERT INTO offer(id, studentId, companyName, salary, bonus, offerDate) VALUES
  (1, 2, 'KPMG', 95000, 7000, '2021-09-30'),
  (2, 2, 'Deloitte Digital', 94000, 12000, '2021-10-03'),
  (3, 2, 'IU, ISGP', 54000, 0, '2021-10-05'),
  (4, 3, 'Amazon', 122000, 11000, '2021-10-15')
;

-- ALTER TABLE offer ADD COLUMN
-- STATUS enum('Unanswered', 'Accepted', 'Declined', 'Negotiating')
-- NOT NULL DEFAULT 'Unanswered';

-- SELECT name, username, MAX(salary) AS maxSalary, COUNT(salary) AS offerCount
-- FROM student LEFT OUTER JOIN offer ON student.id = offer.studentid
-- GROUP BY username, name;

DROP TABLE IF EXISTS books;
CREATE TABLE books (
	id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title varchar(250) NOT NULL,
    author varchar(100) NOT NULL,
    year_published YEAR(4) NOT NULL,
    publisher varchar(250) NOT NULL,
    page_count smallint NOT NULL,
    msrp decimal(10, 2) NOT NULL
);

INSERT INTO books (id, title, author, year_published, publisher, page_count, msrp) VALUES 
(1, 'A Storm of Swords', 'George R.R Martin', '2002', 'Random House Publishing Group', 1008, 17.99),
(2, 'Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future', 'Ashlee Vance', '2017', 'HarperCollins Publishers', 416, 17.99),
(3, 'The Martian', 'Andy Weir', '2014', 'Random House Publishing Group', 416, 14.99),
(4, 'Pride and Prejudice', 'Jane Austen', '2002', 'Penguin Publishing Group', 480, 9.00),
(5, 'The Great Gatsby', 'F. Scott Fitzgerald', '2004', 'Scribner', 208, 13.99);

-- COMMIT;

-- CREATE USER 'msisreader'@'%' IDENTIFIED BY 'msisreadonly';
-- GRANT SELECT ON * . * TO 'msisreader'@'%';