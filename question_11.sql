
-- =====================================
-- COLLEGE MANAGEMENT SYSTEM
-- =====================================

CREATE DATABASE CollegeManagement;
USE CollegeManagement;

-- 1. DEPARTMENT TABLE
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(30),
    department_block_number INT
);

-- 2. STUDENT TABLE
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(30),
    address VARCHAR(40),
    city VARCHAR(30),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
);

-- 3. STAFF TABLE
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(30),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
);

-- 4. SUBJECT TABLE
CREATE TABLE Subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(30),
    subject_code VARCHAR(10),
    staff_id INT,
    FOREIGN KEY (staff_id)
        REFERENCES Staff(staff_id)
);

-- 5. MARK TABLE
CREATE TABLE Mark (
    `value` INT,
    subject_id INT,
    student_id INT,
    PRIMARY KEY (subject_id, student_id),
    FOREIGN KEY (subject_id)
        REFERENCES Subject(subject_id),
    FOREIGN KEY (student_id)
        REFERENCES Student(student_id)
);


-- =====================================
-- INSERT DATA
-- =====================================

-- DEPARTMENT
INSERT INTO Department VALUES
(1, 'Computer Science', 101),
(2, 'Electronics', 102),
(3, 'Mechanical', 103);

-- STUDENT
INSERT INTO Student VALUES
(101, 'Rahul', 'Salt Lake', 'Kolkata', 1),
(102, 'Priya', 'Park Street', 'Kolkata', 1),
(103, 'Amit', 'Howrah', 'Howrah', 2),
(104, 'Sneha', 'Durgapur', 'Durgapur', 2),
(105, 'Arjun', 'Bally', 'Howrah', 3);

-- STAFF
INSERT INTO Staff VALUES
(201, 'Anita', 1),
(202, 'Suman', 1),
(203, 'Rakesh', 2),
(204, 'Neha', 3);

-- SUBJECT
INSERT INTO Subject VALUES
(301, 'DBMS', 'CS101', 201),
(302, 'Java', 'CS102', 202),
(303, 'Python', 'CS103', 201),
(304, 'Digital Electronics', 'EC101', 203),
(305, 'Thermodynamics', 'ME101', 204);

-- MARK
INSERT INTO Mark VALUES
(85, 301, 101),
(90, 302, 101),
(78, 303, 101),
(92, 301, 102),
(88, 302, 102),
(76, 303, 102),
(81, 304, 103),
(89, 304, 104),
(95, 305, 105);



select p.student_name, s.subject_name, m.value as MARKS
from Subject as s join Mark as m
on s.subject_id = m.subject_id
join Student as p
on p.student_id = m.student_id;





