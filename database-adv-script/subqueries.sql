-- Rating is greater than 4.0
SELECT * FROM property
WHERE property_id IN
(SELECT property_id FROM Review
WHERE rating >=4);

-- users who have made more than 3 bookings
SELECT user_id, COUNT(user_id) AS totalbookings
FROM Booking 
WHERE user_id IN
(SELECT user_id FROM User)
GROUP BY user_id

