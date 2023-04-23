DELIMITER \\
CREATE PROCEDURE AddBooking(IN Booking_ID INT, IN Customer_ID INT, IN B_Date DATE, IN Table_Nr INT)
BEGIN
INSERT INTO Bookings (BookingID, CustomerID, Date, TableNr) VALUES (Booking_ID, Customer_ID, B_date, Table_Nr);
SELECT "New Booking added" AS "Confirmation";
END\\
DELIMITER ;
CALL AddBooking(13, 2, "2022-12-30", 4);