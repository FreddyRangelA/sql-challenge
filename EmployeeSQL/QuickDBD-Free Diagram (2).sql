-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/wUbWTP
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
DROP TABLE IF EXISTS deparments;
CREATE TABLE "deparments" (
    -- several department can be under one manage, therefore, one to many.
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NULL,
    CONSTRAINT "pk_deparments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    -- one to one relation.
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    -- one to one relation.
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "employees" (
    -- only one employee can have one salary.
    "emp_no" int   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "deparments" ADD CONSTRAINT "fk_deparments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_manager" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "deparments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_emp" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

--1.List of details for employees.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex,salaries.salary FROM employees
JOIN salaries
ON employees.emp_no=salaries.emp_no;

--2.List with details from employees hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01'AND '1987-01-01';

--3.Linst of manager for each deparment.
SELECT * FROM deparments;
SELECT * FROM dept_manager;
SELECT * FROM employees;
 
SELECT deparments.dept_no, deparments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name FROM deparments
JOIN dept_manager
ON deparments.dept_no = dept_manager.dept_no
JOIN employees
ON employees.emp_no = dept_manager.emp_no;

--4.list the deparment for each employee.
SELECT employees.emp_no,employees.last_name, employees.first_name,deparments.dept_name FROM employees
JOIN dept_emp
on employees.emp_no=dept_emp.emp_no
JOIN deparments
on dept_emp.dept_no=deparments.dept_no;

--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex FROM employees
WHERE employees.first_name = 'Hercules'
AND employees.last_name LIKE 'B%';




