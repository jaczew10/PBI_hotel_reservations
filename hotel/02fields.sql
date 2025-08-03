USE hotel;


ALTER TABLE Hotel_Reservations
ADD reservation_date AS DATEADD(DAY, -lead_time, arrival_date);


ALTER TABLE Hotel_Reservations
ADD arrival_season VARCHAR(10);


UPDATE Hotel_Reservations
SET arrival_season = 
  CASE 
    WHEN MONTH(arrival_date) IN (3,4,5) THEN 'Spring'
    WHEN MONTH(arrival_date) IN (6,7,8) THEN 'Summer'
    WHEN MONTH(arrival_date) IN (9,10,11) THEN 'Autumn'
    WHEN MONTH(arrival_date) IN (12,1,2) THEN 'Winter'
    ELSE 'Unknown'
  END;


ALTER TABLE Hotel_Reservations
ADD booking_cost AS (total_nights * avg_price_per_room);


ALTER TABLE Hotel_Reservations
ADD guest_type AS (
  CASE 
	WHEN repeated_guest = 1 THEN 'Regular guest'
	ELSE 'New guest'
  END
);


ALTER TABLE dbo.Hotel_Reservations
ADD lead_time_catery AS (
  CASE
    WHEN lead_time <= 3   THEN 'Last Minute'
    WHEN lead_time <= 14  THEN 'Short-Term'
    WHEN lead_time <= 30  THEN 'Mid-Term'
    WHEN lead_time <= 90  THEN 'Long-Term'
    ELSE 'Very Long-Term'
  END
);


ALTER TABLE Hotel_Reservations
ADD reservation_season VARCHAR(10);


UPDATE Hotel_Reservations
SET reservation_season = 
  CASE 
    WHEN MONTH(reservation_date) IN (3,4,5) THEN 'Spring'
    WHEN MONTH(reservation_date) IN (6,7,8) THEN 'Summer'
    WHEN MONTH(reservation_date) IN (9,10,11) THEN 'Autumn'
    WHEN MONTH(reservation_date) IN (12,1,2) THEN 'Winter'
    ELSE 'Unknown'
  END;
