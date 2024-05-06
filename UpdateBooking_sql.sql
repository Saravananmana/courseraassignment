USE LittleLemonDB;

DELIMITER //

CREATE PROCEDURE UpdateBooking (
IN booking_id INT,
IN new_booking_date DATETIME
)
BEGIN
	UPDATE Bookings
    SET BookingDate = new_booking_date 
    WHERE BookingID = booking_id;
    
    SELECT CONCAT("Booking with ID ", booking_id, " updated successfully.") AS Confirmation;
END //

DELIMITER ;

CALL UpdateBooking(8, "2022-10-13");