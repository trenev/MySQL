DELIMITER //
CREATE FUNCTION udf_courses_by_client (phone_num VARCHAR(20))
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN (
		SELECT COUNT(co.`id`)
		FROM `clients` AS cl
		LEFT JOIN `courses` AS co
			ON cl.`id` = co.`client_id`
		WHERE cl.`phone_number` = phone_num
		GROUP BY cl.`id`
    );
END//

DELIMITER ;
SELECT udf_courses_by_client ('(803) 6386812') as `count`; 

SELECT udf_courses_by_client ('(831) 1391236') as `count`;

SELECT udf_courses_by_client ('(704) 2502909') as `count`;
