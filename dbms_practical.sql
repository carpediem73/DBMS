

-- Question 2: Course Registration System
-- A. Theory:
-- Explain the importance of integrity constraints in SQL. Describe how Primary Key, Foreign Key, NOT NULL, UNIQUE, DEFAULT, and CHECK constraints prevent invalid data. Also explain how DDL and DML commands are used to manage the database.
-- B. Practical:
-- Create a Course Registration System using Student and Course tables.
-- 1. Create both tables with suitable attributes.
-- 2. Use a Primary Key for each table and establish a Foreign Key relationship.
-- 3. Apply suitable NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
-- 4. Insert at least 5 students and 4 courses.
-- 5. Display students enrolled in a particular course.
-- 6. Update the course of a student.
-- 7. Delete a student using a suitable condition.
-- 8. Add a new column using ALTER.
-- 9. Rename one table using RENAME.
-- 10. Display the final records using SELECT.


CREATE DATABASE course_registration_system;
USE course_registration_system;

CREATE TABLE Student(
uid VARCHAR(50) PRIMARY KEY,
name VARCHAR(100) NOT NULL,
age INT NOT NULL CHECK(age>18),
email VARCHAR(100) UNIQUE
);

CREATE TABLE Course(
course_id VARCHAR(50) PRIMARY KEY,
course_name VARCHAR(100) NOT NULL,
uid VARCHAR(50) NOT NULL,
FOREIGN KEY(uid) REFERENCES Student(uid)
);

INSERT INTO Student(uid,name,age,email) 
VALUES
('105','Rahul',20,'rahul@gmail.com'),
('106','Riya',19,'riya@gmail.com'),
('107','Sita',19,'sita@gmail.com'),
('108','Ram',20,'ram@gmail.com'),
('110','Priya',20,'priya@gmail.com');

INSERT INTO Course(course_id,course_name,uid)
 VALUES
('5','IT','105'),
('6','AIML','106'),
('7','CYBER','107'),
('8','IT','108');

SELECT Student.name,Course.course_name
FROM Student
JOIN Course ON Student.uid=Course.uid
WHERE Course.course_name='IT';

UPDATE Course
SET course_name='AIML'
WHERE uid='105';

DELETE FROM Course
WHERE uid='107';

DELETE FROM Student
WHERE uid='107';

ALTER TABLE Student
ADD registration_year VARCHAR(10) DEFAULT '2025';

RENAME TABLE Course TO Student_Course;

SELECT * FROM Student;
SELECT * FROM Student_Course;