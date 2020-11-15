START TRANSACTION;
BEGIN;
SELECT * FROM employees LIMIT 10;
UPDATE employees 
	SET first_name = 'Nathan', last_name = 'Exploision', gender ='M'
    WHERE emp_no = 10001;
ROLLBACK
