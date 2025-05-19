SELECT user_id, COUNT(user_id) AS totalbookings
FROM Booking 
WHERE user_id IN
(SELECT user_id FROM User)
GROUP BY user_id