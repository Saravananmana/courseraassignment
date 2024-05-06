USE LittleLemonDB;

PREPARE GetOrderDetail FROM 'SELECT Orders.OrderID, Orders.Quantity, Orders.TotalCost, 
Customer.CustomerID FROM Orders INNER JOIN Customer ON Orders.OrderID = Customer.OrderID WHERE CustomerID = ?'; 

SET @id = 1;
EXECUTE GetOrderDetail USING @id;