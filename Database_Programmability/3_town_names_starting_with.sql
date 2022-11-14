DELIMITER //
CREATE PROCEDURE usp_get_towns_starting_with(str_name VARCHAR(20))
BEGIN
	SELECT `name`
	FROM towns
	WHERE `name` LIKE CONCAT(str_name, '%')
	ORDER BY `name`;
END //

DELIMITER ;
CALL usp_get_towns_starting_with('be');

