DELIMITER //
CREATE PROCEDURE udp_courses_by_address (address_name VARCHAR(100))
BEGIN
	SELECT
		a.`name`,
		cl.`full_name`,
		CASE
			WHEN co.`bill` <= 20 THEN 'Low'
			WHEN co.`bill` > 30 THEN 'High'
			ELSE 'Medium'
		END AS `level_of_bill`,
		c.`make`,
		c.`condition`,
		ca.`name` AS `cat_name`
	FROM `addresses` AS a
	JOIN `courses` AS co
		ON a.`id` = co.`from_address_id`
	JOIN `clients` AS cl
		ON cl.`id` = co.`client_id`
	JOIN `cars` AS c
		ON c.`id` = co.`car_id`
	JOIN `categories` AS ca
		ON ca.`id` = c.`category_id`
	WHERE a.`name` = address_name
	ORDER BY c.`make`, cl.`full_name`;
END//

DELIMITER ;
CALL udp_courses_by_address('700 Monterey Avenue');
CALL udp_courses_by_address('66 Thompson Drive');



    
    
    