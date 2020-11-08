SELECT title, country_id, region_id FROM geodata._cities WHERE title = 'Чоп';
SELECT title FROM geodata._cities WHERE region_id = (SELECT id FROM geodata._regions WHERE title = 'Московская область');

SELECT AVG(salary), dept_name FROM employee.dept_emp LEFT JOIN (employee.salaries, employee.departments) ON (employee.salaries.emp_no = employee.dept_emp.emp_no AND employee.departments.dept_no = employee.dept_emp.dept_no) GROUP BY dept_name;
SELECT MAX(salary), CONCAT(last_name, ', ', first_name) AS full_name FROM employee.salaries LEFT JOIN (employee.employees) ON (employee.salaries.emp_no = employee.employees.emp_no);
DELETE FROM  employee.employees WHERE (SELECT MAX(salary), CONCAT(last_name, ', ', first_name) AS full_name FROM employee.salaries LEFT JOIN (employee.employees) ON (employee.salaries.emp_no = employee.employees.emp_no));
SELECT COUNT(emp_no), dept_name FROM employee.dept_manager LEFT JOIN (employee.departments) ON (employee.departments.dept_no = employee.dept_manager.dept_no) GROUP BY dept_name;
SELECT dept_name, SUM(salary) FROM employee.dept_manager LEFT JOIN (employee.departments, employee.salaries) ON (employee.departments.dept_no = employee.dept_manager.dept_no AND employee.salaries.from_date = employee.dept_manager.from_date) GROUP BY dept_name;
