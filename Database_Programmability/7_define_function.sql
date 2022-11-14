DELIMITER //
CREATE FUNCTION ufn_is_word_comprised(
	set_of_letters VARCHAR(50),
    word VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN (SELECT word REGEXP CONCAT('^[', set_of_letters, ']+$'));
END //

DELIMITER ;
SELECT ufn_is_word_comprised('oistmiahf', 'Sofia');
SELECT ufn_is_word_comprised('oistmiahf', 'halves');
SELECT ufn_is_word_comprised('bobr', 'Rob');
SELECT ufn_is_word_comprised('pppp', 'Guy');
