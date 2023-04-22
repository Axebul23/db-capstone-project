DELIMITER \\
CREATE PROCEDURE CancelOrder(Orderid INT)
BEGIN
DELETE FROM Orders WHERE OrderID=Orderid;
SELECT CONCAT("Order ", OrderID, " is cancelled") as Confirmation;
END\\
DELIMITER ;
CALL CancelOrder(5);