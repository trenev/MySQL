SELECT
	cl.`full_name`,
    COUNT(ca.`id`) AS `count_of_cars`,
    SUM(co.`bill`) AS `total_sum`
FROM `clients` AS cl
JOIN `courses` AS co
	ON cl.`id` = co.`client_id`
JOIN `cars` AS ca
	ON ca.`id` = co.`car_id`
WHERE SUBSTRING(cl.`full_name`, 2, 1) = 'a'
GROUP BY cl.`id`
HAVING `count_of_cars` > 1
ORDER BY cl.`full_name`;