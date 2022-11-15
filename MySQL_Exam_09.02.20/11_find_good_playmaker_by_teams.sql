DELIMITER //
CREATE PROCEDURE udp_find_playmaker (min_dribble_points INT, team_name VARCHAR(45))
BEGIN
	SELECT
		CONCAT_WS(' ', p.`first_name`, p.`last_name`) AS `full_name`,
		p.`age`,
		p.`salary`,
		s.`dribbling`,
		s.`speed`,
		t.`name`
	FROM `teams` AS t
	JOIN `players` AS p
		ON t.`id` = p.`team_id`
	JOIN `skills_data` AS s
		ON p.`skills_data_id` = s.`id`
	WHERE t.`name` = team_name AND s.`dribbling` > min_dribble_points
	ORDER BY s.`speed` DESC
	LIMIT 1;
END//

DELIMITER ;
CALL udp_find_playmaker (20, 'Skyble');
