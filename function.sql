CREATE DEFINER=`root`@`localhost` FUNCTION `find_manager`(last_name_param varchar(45), first_name_param varchar(45)) RETURNS int
    DETERMINISTIC
BEGIN
DECLARE result INT;
SELECT 
    emp_no
INTO result FROM
    employee.employees
WHERE
    last_name = last_name_param
        AND first_name = first_name_param;
RETURN result;
END