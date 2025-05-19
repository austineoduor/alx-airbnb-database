-- INNER JOIN
SELECT User.*, Booking.*
FROM User
INNER JOIN Booking
ON User.user_id = Booking.user_id;

-- LEFT JOIN
SELECT Property.*, Review.*
FROM Property
LEFT JOIN Review
ON Property.property_id = Review.property_id;


/* FULL JOIN is a combination of RIGHT and LEFT Joins
*/
-- LEFT JOIN
SELECT User.*, Booking.*
FROM User
LEFT JOIN Booking
ON User.user_id = Booking.user_id

UNION

-- RIGHT JOIN
SELECT User.*, Booking.*
FROM User
RIGHT JOIN Booking
ON User.user_id = Booking.user_id;