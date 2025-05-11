- insert
-- Insert data into User table
INSERT INTO User (first_name, last_name, email, password_hash, phone_number, role) VALUES
('Alice', 'Smith', 'alice.smith@example.com', 'hashed_password_1', '555-123-4567', 'guest'),
('Bob', 'Johnson', 'bob.johnson@example.com', 'hashed_password_2', '555-987-6543', 'host'),
('Charlie', 'Brown', 'charlie.brown@example.com', 'hashed_password_3', '555-111-2222', 'admin'),
('David', 'Lee', 'david.lee@example.com', 'hashed_password_4', '555-333-4444', 'guest'),
('Eve', 'Davis', 'eve.davis@example.com', 'hashed_password_5', '555-555-6666', 'host'),
('Michael', 'Garcia', 'michael.garcia@example.com', 'hashed_password_6', '555-777-8888', 'guest');


-- Insert data into Property table
INSERT INTO Property (host_id, name, description, location, pricepernight) VALUES
(2, 'Cozy Cabin in the Woods', 'A charming cabin nestled among tall trees, perfect for a relaxing getaway.', 'Aspen, CO', 150.00),
(2, 'Luxury Beachfront Villa', 'Enjoy stunning ocean views from this spacious and well-appointed villa.', 'Maui, HI', 500.00),
(5, 'Modern City Apartment', 'A stylish apartment in the heart of the city, close to restaurants and attractions.', 'New York, NY', 250.00),
(5, 'Historic Farmhouse Retreat', 'Experience the charm of rural living in this beautifully restored farmhouse.', 'Napa Valley, CA', 300.00),
(2, 'Mountain View Condo', 'Comfortable condo with breathtaking views of the surrounding mountains.', 'Banff, Canada', 200.00),
(5, 'Lakeside Cottage', 'Quaint cottage right on the lake, perfect for swimming and fishing.', 'Lake Tahoe, CA', 180.00);

-- Sample data for the Booking table

-- Booking 1: Pending booking for property 1 by user 1
INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status) VALUES
(1, 1, '2024-01-15', '2024-01-20', 500.00, 'pending'),
-- Booking 2: Confirmed booking for property 2 by user 2
(2, 2, '2024-02-10', '2024-02-17', 850.50, 'confirmed'),
-- Booking 3: Canceled booking for property 3 by user 3
(3, 3, '2024-03-01', '2024-03-05', 300.00, 'canceled'),
-- Booking 4: Confirmed booking for property 1 by user 2
(1, 2, '2024-04-01', '2024-04-08', 700.00, 'confirmed');

-- Insert data into Payment table

INSERT INTO Payment (booking_id, amount, payment_method) VALUES
(1, 150.00, 'credit card'),
-- Payment for booking_id 2, using paypal
(2, 75.50, 'paypal'),
-- Payment for booking_id 3, using stripe
(3, 220.75, 'stripe'),
-- Payment for booking_id 4 again (e.g., additional charges) using credit card
(4, 25.00, 'credit card');


-- Insert data into Review table
INSERT INTO Review (property_id, user_id, rating, comment, created_at) VALUES
(1, 1, 5, 'Wonderful cabin!  Very clean and cozy.', '2023-12-28'),
(2, 4, 4, 'Great villa with amazing views.  A bit pricey, though.', '2024-01-23'),
(3, 1, 3, 'The apartment was conveniently located, but a bit noisy.', '2024-02-06'),
(4, 6, 5, 'We had a fantastic time at the farmhouse.  Highly recommended!', '2024-03-18'),
(5, 4, 4, 'Beautiful views from the condo.  Could use some updating.', '2024-04-09'),
(6, 1, 5, 'The cottage was perfect for a relaxing lake vacation.', '2024-05-13');

-- Insert data into Message table
INSERT INTO Message (sender_id, recipient_id, message_body, sent_at) VALUES
(1, 2, 'Hi Bob, I had a great stay at your cabin!', '2023-12-29 10:00:00'),
(2, 1, 'Thanks Alice! Glad you enjoyed it.', '2023-12-29 10:15:00'),
(4, 5, 'Eve, the villa was amazing!', '2024-01-24 14:00:00'),
(5, 4, 'Thanks David! Come back anytime.', '2024-01-24 14:30:00'),
(1, 3, 'Charlie, can you reset my password?', '2024-02-07 09:00:00'),
(3, 1, 'Sure Alice, I just sent you a temporary password.', '2024-02-07 09:15:00');