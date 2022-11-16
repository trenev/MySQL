INSERT INTO `products`(
	`name` ,
    `type`,
    `price`
)
SELECT
	CONCAT(`last_name`, ' ', 'specialty'),
    'Cocktail',
    CEIL(`salary` * 0.01)
FROM `waiters`
WHERE `id` > 6;