SELECT
	t.`id` AS `table_id`,
    t.`capacity`,
    COUNT(c.`id`) AS `count_clients`,
    CASE
		WHEN t.`capacity` > COUNT(c.`id`) THEN 'Free seats'
		WHEN t.`capacity` < COUNT(c.`id`) THEN 'Extra seats'
        ELSE 'Full'
    END AS `availability`
FROM `tables` AS t
JOIN `orders` AS o
	ON t.`id` = o.`table_id`
JOIN `orders_clients` AS oc
	ON o.`id` = oc.`order_id`
JOIN `clients` AS c
	ON c.`id` = oc.`client_id`
WHERE t.`floor` = 1
GROUP BY t.`id`
ORDER BY t.`id` DESC;
