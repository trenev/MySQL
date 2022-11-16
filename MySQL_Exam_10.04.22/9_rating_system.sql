SELECT
	m.`title`,
    CASE
		WHEN i.`rating` <= 4 THEN 'poor'
		WHEN i.`rating` > 7 THEN 'excellent'
        ELSE 'good'
	END AS `rating`,
    IF(i.`has_subtitles`, 'english', '-') AS `subtitles`,
    i.`budget`
FROM `movies` AS m
JOIN `movies_additional_info` AS i
	ON i.`id` = m.`movie_info_id`
ORDER BY i.`budget` DESC;