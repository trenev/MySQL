DELIMITER //
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(accounts_sum DECIMAL)
BEGIN
	SELECT ah.first_name, ah.last_name
	FROM account_holders AS ah
	JOIN accounts AS a
	ON ah.id = a.account_holder_id
	GROUP BY a.account_holder_id
    HAVING SUM(a.balance) > accounts_sum
	ORDER BY ah.id;
END //

DELIMITER ;
CALL usp_get_holders_with_balance_higher_than(700000);
