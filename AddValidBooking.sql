DELIMITER \\

CREATE FUNCTION Validate(BookingFound INT, msg VARCHAR(255)) RETURNS INT DETERMINISTIC
BEGIN
    IF BookingFound IS NOT NULL THEN
        SIGNAL SQLSTATE 'ERR0R' SET MESSAGE_TEXT = msg;
    END IF;
    RETURN BookingFound;
END;

CREATE PROCEDURE AddValidBooking(IN B_Date DATE, IN Table_Nr INT)
	BEGIN
		DECLARE `_rollback` BOOL DEFAULT 0;
		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
		START TRANSACTION;
        
        SELECT Validate(COUNT(*), CONCAT("Table ", Table_Nr, " is already booked"))
        FROM Bookings
        WHERE Date = B_Date AND TableNr = Table_Nr;
        
		INSERT INTO Bookings (Date, TableNr)
		VALUES (B_Date, Table_Nr);
		
		IF `_rollback` THEN
			SELECT CONCAT("Table ", Table_Nr, " is already booked - booking cancelled") AS "Booking status";
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
    END; \\
    
DELIMITER ;

CALL AddValidBooking("2022-12-17", 6);