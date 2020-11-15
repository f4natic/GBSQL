EXPLAIN 
SELECT * FROM employees AS e
LEFT JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE e.gender = 'M';