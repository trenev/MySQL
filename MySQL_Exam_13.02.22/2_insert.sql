INSERT INTO `reviews` (`content`, `rating`, `picture_url`, `published_at`)
SELECT
	LEFT(`description`, 15) AS `content`,
    `price` / 8 AS `rating`,
    REVERSE(`name`) AS `picture_url`,
    '2010-10-10' AS `published_at`
FROM `products`
WHERE `id`>= 5;