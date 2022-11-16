SELECT
	m.`id`,
	m.`title`,
    i.`runtime`,
    i.`budget`,
    i.`release_date`
FROM `movies`AS m
JOIN `movies_additional_info` AS i
	ON m.`movie_info_id` = i.`id`
WHERE YEAR(i.`release_date`) BETWEEN 1996 AND 1999
ORDER BY i.`runtime`, m.`id`
LIMIT 20;