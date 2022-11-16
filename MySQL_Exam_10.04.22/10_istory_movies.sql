DELIMITER //
CREATE FUNCTION udf_actor_history_movies_count(full_name VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN (
		SELECT COUNT(a.`id`) AS `count`
		FROM `actors` AS a
		JOIN `movies_actors` AS ma
			ON a.`id` = ma.`actor_id`
		JOIN `movies` AS m
			ON m.`id` = ma.`movie_id`
		JOIN `genres_movies` AS gm
			ON m.`id` = gm.`movie_id`
		JOIN `genres` AS g
			ON g.`id` = gm.`genre_id`
		WHERE
			g.`name` = 'History' AND 
            CONCAT(a.`first_name`, ' ', a.`last_name`) = full_name
		GROUP BY a.`id`
    );
END//

DELIMITER ;
SELECT udf_actor_history_movies_count('Stephan Lundberg')  AS 'history_movies';
SELECT udf_actor_history_movies_count('Jared Di Batista')  AS 'history_movies';