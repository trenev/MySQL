SELECT
	a.`name`,
	IF(HOUR(co.`start`) BETWEEN 6 AND 20, 'Day', 'Night')
		AS `day_time`,
	co.`bill`,
	cl.`full_name`,
    ca.`make`,
    ca.`model`,
    cat.`name`
FROM `clients` AS cl
JOIN `courses` AS co
	ON cl.`id` = co.`client_id`
JOIN `cars` AS ca
	ON ca.`id` = co.`car_id`
JOIN `categories` AS cat
	ON cat.`id` = ca.`category_id`
JOIN `addresses` AS a
	ON a.`id` = co.`from_address_id`
ORDER BY co.`id`;