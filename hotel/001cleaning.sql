USE hotel;

DELETE FROM Hotel_Reservations
WHERE arrival_month = 2 AND arrival_day = 29 AND arrival_year NOT IN (2016, 2020, 2024);

UPDATE Hotel_Reservations
SET arrival_date = TRY_CONVERT(
    DATE,
    CAST(arrival_year  AS VARCHAR(4)) + '-' +
    CAST(arrival_month AS VARCHAR(2)) + '-' +
    CAST(arrival_day   AS VARCHAR(2))
);

UPDATE Hotel_Reservations
SET room_type_reserved = REPLACE(room_type_reserved, 'Room_', '');

UPDATE Hotel_Reservations
SET booking_status = 'Completed' WHERE booking_status = 'Not_Canceled';