PREPARE GetOrderDetails FROM "SELECT OrderID, Quantity, TotalCost FROM Orders WHERE OrderID = ?";
SET @ID = 1;
EXECUTE GetOrderDetails USING @ID;