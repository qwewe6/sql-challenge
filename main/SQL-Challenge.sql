-- ##SCHEMA

DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_no CHAR(40) PRIMARY KEY,
    dept_name VARCHAR(40) UNIQUE 
);

SELECT * FROM departments

DROP TABLE IF EXISTS dept_emp;

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no CHAR(40) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),  
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no), 
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)   
);

SELECT * FROM dept_emp;

DROP TABLE IF EXISTS dept_mangers;

CREATE TABLE dept_managers (
    dept_no CHAR(40) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),  
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),  
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
);

SELECT * FROM dept_managers

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,  
    emp_title_id VARCHAR(40),
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex CHAR(1),
);

SELECT * FROM employees;

DROP TABLE IF EXISTS salaries;

CREATE TABLE salaries (
   emp_no INT NOT NULL,
   salary INT,
   PRIMARY KEY (emp_no),  
   FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
);

SELECT * FROM salaries

DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
    title_id VARCHAR(20) PRIMARY KEY,
    title VARCHAR(50) NOT NULL  
);

-- ##ERD

departments
-
dept_no CHAR PK
dept_name VARCHAR

dept_emp
-
emp_no INT PK FK >- employees.emp_no
dept_no CHAR PK FK >- departments.dept_no

dept_managers
-
emp_no INT PK FK >- employees.emp_no
dept_no CHAR PK FK >- departments.dept_no

employees
-
emp_no INT PK
emp_title_id VARCHAR
birth_date DATE
first_name VARCHAR
last_name VARCHAR
sex CHAR
hire_date DATE

salaries
-
emp_no INT PK FK >- employees.emp_no
salary INT

titles
-
 title_id VARCHAR PK
 title VARCHAR