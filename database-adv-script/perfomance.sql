SELECT * 
FROM Booking
INNER JOIN User
ON Booking.booking_id = User.user_id
INNER JOIN Property
ON Property.property_id = Booking.property_id
INNER JOIN Payment
ON Booking.booking_id =Payment.booking_id
ORDER BY  start_date;




EXPLAIN ANALYZE SELECT * 
FROM Booking
INNER JOIN User
ON Booking.booking_id = User.user_id
INNER JOIN Property
ON Property.property_id = Booking.property_id
INNER JOIN Payment
ON Booking.booking_id =Payment.booking_id
ORDER BY  start_date;