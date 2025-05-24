CREATE INDEX first_last_name_index ON User(first_name, last_name);
CREATE INDEX host_id_property_name_index on Property(host_id,name);

EXPLAIN ANALYZE SELECT *
FROM User
LEFT JOIN Booking
ON User.user_id = Booking.user_id
ORDER BY start_date;