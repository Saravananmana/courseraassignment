-- Create stored procedure, AddValidBooking, to allow users to add bookings if there are tables available. If a table is unavailable, the 
-- transaction will rollback 

USE LittleLemonDB;

DELIMITER //

CREATE PROCEDURE AddValidBooking (
IN booking_date DATETIME,
IN table_number INT
)
BEGIN
	DECLARE bookedTable INT DEFAULT 0;
    
    START TRANSACTION;
    
    SELECT COUNT(bookedTable)
    INTO bookedTable
    FROM Bookings WHERE BookingDate = booking_date AND TableNo = table_number;
    IF bookedTable = 0 THEN
    -- Table is available, insert the booking
		INSERT IGNORE INTO Bookings (BookingDate, TableNo)
		VALUES (booking_date, table_number);
    
		COMMIT;
    
		SELECT CONCAT("Booking confirmed for Table ", table_number, " on ", booking_date) AS Booking_status;
    ELSE
		-- Table is already booked, rollback the transaction
        ROLLBACK;
        
        SELECT CONCAT("Booking declined. Table ", table_number, " is already booked on ", booking_date) AS Booking_status;
	END IF;
END //

DELIMITER ;

CALL AddValidBooking('2022-12-17', 6);
