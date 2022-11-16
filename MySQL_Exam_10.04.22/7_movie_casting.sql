SELECT
	CONCAT_WS(' ', a.`first_name`, a.`last_name`) AS `full_name`,
    CONCAT(REVERSE(a.`last_name`), CHAR_LENGTH(a.`last_name`), '@cast.com') AS `email`,
    2022 - YEAR(a.`birthdate`) AS `age`,
    a.`height`
FROM `actors` AS a
LEFT JOIN `movies_actors` AS m
	ON a.`id` = m.`actor_id`
WHERE m.`actor_id` IS NULL
ORDER BY a.`height`;