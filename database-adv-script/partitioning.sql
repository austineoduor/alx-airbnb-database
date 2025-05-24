ELECT start_date, 
       
       COUNT(start_date) OVER(PARTITION BY start_date) TotalBooking
FROM Booking;