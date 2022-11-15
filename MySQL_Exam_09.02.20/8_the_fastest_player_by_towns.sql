SELECT
	MAX(sd.`speed`) AS `max_speed`,
    tn.`name` AS `town_name`
FROM `towns` AS tn
LEFT JOIN `stadiums` AS s
	ON tn.`id` = s.`town_id`
LEFT JOIN `teams` AS tm
	ON s.`id` = tm.`stadium_id`
LEFT JOIN `players` AS p
	ON tm.`id` = p.`team_id`
LEFT JOIN `skills_data` AS sd
	ON sd.`id` = p.`skills_data_id`
WHERE tm.`name` != 'Devify'
GROUP BY tn.`id`
ORDER BY `max_speed` DESC, `town_name`;