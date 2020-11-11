CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `employee`.`find_emp_with_max_salary` AS
    SELECT 
        MAX(`employee`.`salaries`.`salary`) AS `MAX(salary)`,
        CONCAT(`employee`.`employees`.`last_name`,
                ', ',
                `employee`.`employees`.`first_name`) AS `full_name`
    FROM
        (`employee`.`salaries`
        LEFT JOIN `employee`.`employees` ON ((`employee`.`salaries`.`emp_no` = `employee`.`employees`.`emp_no`)))