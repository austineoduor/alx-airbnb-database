DROP TABLE IF EXISTS User,Property, Booking, Payment, Review, Message;

CREATE TABLE User(
user_id INTEGER Primary Key AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
password_hash VARCHAR(1000) NOT NULL,
phone_number VARCHAR(15) NULL,
role ENUM ('guest', 'host', 'admin') NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
INDEX(user_id)
);

CREATE TABLE Property(
property_id INTEGER Primary Key AUTO_INCREMENT,
host_id INT,
Foreign Key(host_id) REFERENCES User(user_id),
name VARCHAR(100) NOT NULL,
description TEXT NOT NULL,
location VARCHAR(100) NOT NULL,
pricepernight DECIMAL NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
INDEX(property_id)
);

CREATE TABLE Booking(
booking_id INTEGER Primary Key AUTO_INCREMENT,
property_id INT,
Foreign Key(property_id) REFERENCES Property(property_id),
user_id INT,
Foreign Key(user_id) REFERENCES User(user_id),
start_date DATE NOT NULL,
end_date DATE NOT NULL,
total_price DECIMAL(10,2) NOT NULL,
status ENUM ('pending', 'confirmed', 'canceled') NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
INDEX(booking_id)
);


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



SELECT start_date, 
       
       COUNT(start_date) OVER(PARTITION BY start_date) TotalBooking
FROM Booking;