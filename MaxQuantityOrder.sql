CREATE PROCEDURE GetMaxQuantity() SELECT MAX(Quantity) AS GetMaxQuantity FROM Orders;
CALL GetMaxQuantity();