CREATE DEFINER=`root`@`localhost` TRIGGER `employees_AFTER_INSERT` AFTER INSERT ON `employees` FOR EACH ROW BEGIN
    INSERT INTO employee.salaries (emp_no, salary, from_date, to_date) VALUES
    (NEW.emp_no, 2000, NEW.hire_date, str_to_date('9999-01-01', '%Y-%m-%d'));
    END