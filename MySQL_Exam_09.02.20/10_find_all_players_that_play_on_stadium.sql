DELIMITER //
CREATE FUNCTION udf_stadium_players_count (stadium_name VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN (
		SELECT COUNT(p.`id`)
		FROM `stadiums` AS s
		LEFT JOIN `teams` AS t
			ON s.`id` = t.`stadium_id`
		LEFT JOIN `players` AS p
			ON t.`id` = p.`team_id`
		WHERE s.`name` = stadium_name
		GROUP BY s.`id`
    );
END//

DELIMITER ;
SELECT udf_stadium_players_count ('Jaxworks') as `count`;

