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
  ON (Employees.empemp_no = Dept_manager.emp_no);
  
-- 4. List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.
SELECT Employees.empemp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Dept_emp ON
Dept_emp.emp_no=Employees.empemp_no
	INNER JOIN Departments
	ON (Departments.dept_no = Dept_emp.dept_no);
	
-- 5. List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM Employees
WHERE
      first_name = 'Hercules'
	  AND last_name LIKE 'R%';
	  
-- 6. 	List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.  
SELECT Employees.empemp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Dept_emp ON
Dept_emp.emp_no=Employees.empemp_no
	INNER JOIN Departments
	ON (Departments.dept_no = Dept_emp.dept_no) 
WHERE Departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
SELECT Employees.empemp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Dept_emp ON
Dept_emp.emp_no=Employees.empemp_no
	INNER JOIN Departments
	ON (Departments.dept_no = Dept_emp.dept_no) 
WHERE Departments.dept_name = 'Sales' or Departments.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.
SELECT last_name, COUNT(empemp_no)
FROM Employees
GROUP BY last_name 
ORDER BY COUNT DESC;
