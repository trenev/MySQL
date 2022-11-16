DELIMITER //
CREATE PROCEDURE udp_happy_hour (type_hh VARCHAR(50))
BEGIN
	UPDATE `products`
	SET `price` = `price` * 0.8
	WHERE `type` = type_hh AND `price` >= 10 AND `id` > 0;
END//

DELIMITER ;
CALL udp_happy_hour ('Cognac');
