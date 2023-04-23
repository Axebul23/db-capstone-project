DELIMITER \\
CREATE PROCEDURE CancelBooking(IN Booking_ID INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = Booking_ID;
SELECT CONCAT("Booking ", Booking_ID, " Cancelled") AS "Confirmation";
END\\
DELIMITER ;
CALL CancelBooking(13);