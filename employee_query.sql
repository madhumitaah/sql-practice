CREATE TABLE employee_info (
    EMPID VARCHAR(10),
    EMPNAME VARCHAR(20),
    DEPTID VARCHAR(10),
    JOINING_DT DATE,
    DOB DATE,
    YRS_OF_EXP DECIMAL(10,0),
    EMPLOYEE_CATEGORY VARCHAR(1)
);

INSERT INTO employee_info 
(EMPID, EMPNAME, DEPTID, JOINING_DT, DOB, YRS_OF_EXP, EMPLOYEE_CATEGORY)
VALUES 
('E101', 'Rahul', 'D01', '2005-03-15', '1985-06-10', 8, 'A'),
('E102', 'Priya', 'D02', '2000-05-20', '1988-02-12', 10, 'B'),
('E103', 'Amit', 'D01', '2010-07-11', '1990-09-15', 4, 'A'),
('E104', 'Sneha', 'D03', '2003-01-10', '1987-11-25', 7, 'C'),
('E105', 'Karan', 'D02', '2002-06-18', '1992-04-05', 3, 'B'),
('E106', 'Neha', 'D01', '2008-09-22', '1986-08-17', 12, 'A'),
('E107', 'Rohan', 'D03', '1999-12-15', '1984-03-20', 15, 'C'),
('E108', 'Anjali', 'D02', '2015-04-01', '1993-07-19', 6, 'B'),
('E109', 'Vikas', 'D01', '2001-01-01', '1989-10-10', 9, 'A'),
('E110', 'Meera', 'D03', '2020-08-12', '1995-12-30', 2, 'C');


SELECT EMPID AS 'Employee ID', 
       EMPNAME AS 'Employee Name' 
FROM employee_info 
WHERE YRS_OF_EXP > 5 
AND JOINING_DT > '2001-01-01';
