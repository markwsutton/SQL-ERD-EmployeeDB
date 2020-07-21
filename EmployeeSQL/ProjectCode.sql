-- Table 1 Departments-------------
CREATE TABLE Departments (
    dept_no varchar(255) PRIMARY KEY NOT NULL,
    dept_name varchar(255)   NOT NULL
);

SELECT * FROM Departments

COPY Departments FROM '/Users/marksutton/Public/departments.csv' DELIMITER ',' CSV HEADER;

-- Table 2 Dept_emp---------------
--DROP TABLE Dept_emp;
CREATE TABLE Dept_emp (
    emp_no int NOT NULL,
    dept_no varchar(255) NOT NULL,
	PRIMARY KEY(emp_no, dept_no)
);

SELECT * FROM Dept_emp

COPY Dept_emp FROM '/Users/marksutton/Public/dept_emp.csv' DELIMITER ',' CSV HEADER;

--Table 3 Dept_manager
CREATE TABLE Dept_manager (
    dept_no varchar(255)   NOT NULL,
    emp_no int   NOT NULL
);

SELECT * FROM Dept_manager

COPY Dept_manager FROM '/Users/marksutton/Public/dept_manager.csv' DELIMITER ',' CSV HEADER;

--Table 4 Employees
CREATE TABLE Employees (
    empemp_no int PRIMARY KEY NOT NULL,
    emp_title_id varchar(255)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(255)   NOT NULL,
    last_name varchar(255)   NOT NULL,
    sex varchar(2)   NOT NULL,
    hire_date date   NOT NULL
);

SELECT * FROM Employees

COPY Employees FROM '/Users/marksutton/Public/employees.csv' DELIMITER ',' CSV HEADER;

--Table 5 Salaries
CREATE TABLE Salaries (
    emp_no int PRIMARY KEY NOT NULL,
    salary int   NOT NULL
);

SELECT * FROM Salaries

COPY Salaries FROM '/Users/marksutton/Public/salaries.csv' DELIMITER ',' CSV HEADER;

--Table 6 Titles
CREATE TABLE Titles (
    title_id varchar(255) PRIMARY KEY  NOT NULL,
    title varchar(255)   NOT NULL
);

SELECT * FROM Titles;

COPY Titles FROM '/Users/marksutton/Public/titles.csv' DELIMITER ',' CSV HEADER;
-----------------------------
-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, 
-- first name, sex, and salary.

SELECT Employees.empemp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees
INNER JOIN Salaries ON
Salaries.emp_no=Employees.empemp_no;

--COPY (SELECT * FROM tracks WHERE genre_id = 6) TO '/Users/dave/Downloads/blues_tracks.csv' DELIMITER ',' CSV HEADER;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM Employees
WHERE
      hire_date >= '1986-01-01'
  AND hire_date <  '1987-01-01';
  
-- 3. List the manager of each department with the following information: department number, 
 -- department name, the manager's employee number, last name, first name.
 -- use Departments, Dept_manager, and Employees
SELECT Departments.dept_no, Departments.dept_name, Dept_manager.emp_no, Employees.last_name, Employees.first_name
FROM Departments
INNER JOIN Dept_manager 
ON Dept_manager.dept_no=Departments.dept_no
  INNER JOIN Employees
  ON (Employees.empemp_no = Dept_manager.emp_no)
  
-- 4. List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.
SELECT Employees.empemp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Dept_emp ON
Dept_emp.emp_no=Employees.empemp_no
	INNER JOIN Departments
	ON (Departments.dept_no = Dept_emp.dept_no)

