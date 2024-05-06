USE LittleLemonDB;

DELIMITER //

CREATE PROCEDURE CheckBooking (
IN booking_date DATETIME,
IN table_number INT
)
BEGIN
DECLARE bookedTable INT DEFAULT 0;
SELECT COUNT(bookedTable)
	INTO bookedTable
    FROM Bookings WHERE BookingDate = booking_date AND TableNo = table_number;
    IF bookedTable > 0 THEN
		SELECT CONCAT("Table ", table_number, " is already booked") AS Booking_status;
        ELSE
        SELECT CONCAT("Table ", table_number, " is not booked") AS Booking_status;
	END IF;
END //

CALL CheckBooking('2022-11-12', 3);