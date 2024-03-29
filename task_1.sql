USE test_bd;

DELIMITER //
CREATE FUNCTION FormatSeconds(seconds INT)
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE result VARCHAR(255);
    
    SET days = seconds DIV (24 * 3600);
    SET seconds = seconds MOD (24 * 3600);
    SET hours = seconds DIV 3600;
    SET seconds = seconds MOD 3600;
    SET minutes = seconds DIV 60;
    SET seconds = seconds MOD 60;
    
    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
    
    RETURN result;
END //
DELIMITER ;

SELECT  FormatSeconds(123456);


DELIMITER //
CREATE FUNCTION GetEvenNumbers(N INT) 
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE counter INT;
    DECLARE evenNumbers VARCHAR(255);
    SET counter = 1;
    SET evenNumbers = '';

    WHILE counter <= N DO
        IF counter % 2 = 0 THEN
            SET evenNumbers = CONCAT(evenNumbers, counter, ', ');
        END IF;
        SET counter = counter + 1;
    END WHILE;

    RETURN evenNumbers;
END//

DELIMITER ;


SELECT  GetEvenNumbers(10);

