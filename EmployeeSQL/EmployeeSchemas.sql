-- Table 1 Departments-------------
DROP TABLE IF EXISTS Departments;
CREATE TABLE Departments (
    dept_no varchar(255) PRIMARY KEY NOT NULL, -- FK - Dept_emp.dept_no
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
DROP TABLE IF EXISTS Dept_manager;
CREATE TABLE Dept_manager (
    dept_no varchar(255)   NOT NULL,
    emp_no int   NOT NULL
);

SELECT * FROM Dept_manager

COPY Dept_manager FROM '/Users/marksutton/Public/dept_manager.csv' DELIMITER ',' CSV HEADER;

--Table 4 Employees
DROP TABLE IF EXISTS Employees;
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
DROP TABLE IF EXISTS Salaries;
CREATE TABLE Salaries (
    emp_no int PRIMARY KEY NOT NULL,
    salary int   NOT NULL
);

SELECT * FROM Salaries

COPY Salaries FROM '/Users/marksutton/Public/salaries.csv' DELIMITER ',' CSV HEADER;

--Table 6 Titles
DROP TABLE IF EXISTS Titles;
CREATE TABLE Titles (
    title_id varchar(255) PRIMARY KEY  NOT NULL,
    title varchar(255)   NOT NULL
);

SELECT * FROM Titles;

COPY Titles FROM '/Users/marksutton/Public/titles.csv' DELIMITER ',' CSV HEADER;