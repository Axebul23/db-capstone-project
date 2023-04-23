DELIMITER \\
CREATE PROCEDURE UpdateBooking(IN Booking_ID INT, IN B_Date DATE)
BEGIN
UPDATE Bookings SET Date = B_Date WHERE BookingID = Booking_ID;
SELECT CONCAT("Booking ", Booking_ID, " Updated") AS "Confirmation";
END\\
DELIMITER ;
CALL UpdateBooking(13, "2022-12-17");