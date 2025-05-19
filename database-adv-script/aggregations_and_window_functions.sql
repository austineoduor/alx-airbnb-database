SELECT user_id, COUNT(user_id) AS totalbookings
FROM Booking 
WHERE user_id IN
(SELECT user_id FROM User)
GROUP BY user_id;


SELECT property_id, COUNT(booking_id) AS totalbookings,
RANK() OVER(PARTITION BY property_id ORDER BY property_id DESC) AS property_rank
FROM Booking
WHERE property_id IN
(SELECT property_id FROM Property)
GROUP BY property_id;

SELECT property_id, COUNT(booking_id) AS totalbookings,
ROW_NUMBER() OVER(PARTITION BY property_id ORDER BY property_id DESC) AS property_rank
FROM Booking
WHERE property_id IN
(SELECT property_id FROM Property)
GROUP BY property_id;