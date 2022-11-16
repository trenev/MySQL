SELECT
	p.`id`,
    p.`name`,
    COUNT(op.`order_id`) AS `count`
FROM `products` AS p
JOIN `orders_products` AS op
	ON p.`id` = op.`product_id`
GROUP BY p.`id`
HAVING `count` >= 5
ORDER BY `count` DESC, p.`name`;
