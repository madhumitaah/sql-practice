
-- ==========================================
-- COLLEGE MANAGEMENT SYSTEM
-- FRESH DATABASE
-- ==========================================

DROP DATABASE IF EXISTS CollegeManagement;

CREATE DATABASE CollegeManagement;
USE CollegeManagement;


-- ==========================================
-- 1. CREATE TABLES
-- ==========================================

-- DEPARTMENT TABLE
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(30),
    department_block_number INT
);


-- STUDENT TABLE
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(30),
    address VARCHAR(40),
    city VARCHAR(30),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
);


-- STAFF TABLE
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(30),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
);


-- SUBJECT TABLE
CREATE TABLE Subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(30),
    subject_code VARCHAR(10),
    staff_id INT,
    FOREIGN KEY (staff_id)
        REFERENCES Staff(staff_id)
);


-- MARK TABLE
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


-- ==========================================
-- 2. INSERT DATA
-- ==========================================

-- DEPARTMENT
INSERT INTO Department VALUES
(1, 'Computer Science', 101),
(2, 'Electronics', 102),
(3, 'Mechanical', 103),
(4, 'Biology', 104),
(5, 'Civil', 105);


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


-- ==========================================
-- 3. Q1: STUDENT NAME, SUBJECT NAME AND MARKS
-- ==========================================

SELECT
    p.student_name,
    s.subject_name,
    m.`value` AS MARKS
FROM Subject s
JOIN Mark m
    ON s.subject_id = m.subject_id
JOIN Student p
    ON p.student_id = m.student_id;


-- ==========================================
-- 4. Q2: COUNT STUDENTS IN EACH DEPARTMENT
-- USING LEFT JOIN
-- ==========================================

SELECT
    d.department_name,
    COUNT(s.student_id) AS student_count
FROM Department d
LEFT JOIN Student s
    ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name;


-- ==========================================
-- 5. Q3: SAME QUESTION USING INNER JOIN
-- ==========================================



-- ==========================================
-- 6. CHECK ALL DEPARTMENTS
-- ==========================================

