CREATE TABLE IF NOT EXISTS  `logs` (
	log_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    old_sum DECIMAL(19, 4),
    new_sum DECIMAL(19, 4),
    CONSTRAINT fk_logs_accounts FOREIGN KEY (account_id) REFERENCES accounts(id)
);

CREATE TABLE IF NOT EXISTS `notification_emails` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `recipient` INT,
    `subject` VARCHAR(50),
    `body` TEXT
);

DROP TRIGGER IF EXISTS tr_update_accounts;
DROP TRIGGER IF EXISTS tr_send_mail_logs;

DELIMITER //
CREATE TRIGGER tr_update_accounts
AFTER UPDATE
ON accounts
FOR EACH ROW
BEGIN
	INSERT INTO `logs` (account_id, old_sum, new_sum)
    VALUES (OLD.id, OLD.balance, NEW.balance);
END //

CREATE TRIGGER tr_send_mail_logs
AFTER INSERT
ON `logs`
FOR EACH ROW
BEGIN
	INSERT INTO `notification_emails` (`recipient`, `subject`, `body`)
    VALUES (
		NEW.account_id,
        CONCAT('Balance change for account: ', NEW.account_id),
        CONCAT(
			'On ',
            DATE_FORMAT(CURDATE(), '%b %e %Y'),
            ' at ',
            TIME_FORMAT(CURTIME(), '%T %p'),
            ' your balance was changed from ',
            NEW.old_sum, ' to ',
            NEW.new_sum, '.'
            )
        );
END //

DELIMITER ;
SELECT * FROM notification_emails;