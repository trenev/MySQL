DELIMITER //
CREATE PROCEDURE usp_withdraw_money(
	account_id INT,
    money_amount DECIMAL(19, 4))
BEGIN
	START TRANSACTION;
    IF (SELECT COUNT(*) FROM accounts WHERE id = account_id) = 0
		OR money_amount <= 0
        OR (SELECT balance FROM accounts WHERE id = account_id) < money_amount
		THEN ROLLBACK;
    ELSE
		UPDATE accounts
        SET balance = balance - money_amount
        WHERE id = account_id;
    END IF;
END //

DELIMITER ;
CALL usp_withdraw_money(1, 10);
SELECT * 
FROM accounts
WHERE id = 1;
