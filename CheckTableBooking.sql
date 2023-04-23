CREATE PROCEDURE CheckBooking(B_Date DATE, Table_Nr INT)
	SELECT CONCAT("Table ", Table_Nr, " is already booked") WHERE EXISTS (SELECT * FROM Bookings WHERE Date = B_Date AND TableNr = Table_Nr);

CALL CheckBooking("2022-11-12", 3);