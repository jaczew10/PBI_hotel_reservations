USE hotel;


EXEC sp_rename 'Hotel_Reservations.arrival_date', 'arrival_day', 'COLUMN';


ALTER TABLE Hotel_Reservations
ADD arrival_date DATE;

ALTER TABLE Hotel_Reservations
ADD
    total_guests  AS (no_of_adults + no_of_children),
    total_nights  AS (no_of_weekend_nights + no_of_week_nights);