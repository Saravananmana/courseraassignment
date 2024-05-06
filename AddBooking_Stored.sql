USE LittleLemonDB;

DELIMITER //

CREATE PROCEDURE AddBooking(
IN BookingID INT,
IN BookingDate DATETIME,
IN TableNo INT,
IN CustomerID INT
)
BEGIN
	INSERT INTO Bookings (BookingID, BookingDate, TableNo, CustomerID)
    VALUES (bookingID, bookingDate, tableNo, customerID);
    
SELECT CONCAT ("Booking with ID ", bookingID, " added successfully.") AS Confirmation;
END //

DELIMITER ;

CALL AddBooking(5, "2022-12-25", 4, 5);