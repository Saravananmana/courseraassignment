USE LittleLemonDB;

CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE Quantity > 2;

SELECT * FROM OrdersView;