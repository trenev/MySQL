DELIMITER //
CREATE FUNCTION ufn_get_salary_level(e_salary DECIMAL)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	RETURN (CASE
				WHEN e_salary < 30000 THEN 'Low'
				WHEN e_salary > 50000 THEN 'High'
				ELSE 'Average'
			END);
END //

DELIMITER ;
SELECT ufn_get_salary_level(500000);