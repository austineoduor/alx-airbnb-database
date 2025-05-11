DROP IF EXISTS TABLE User,Property, Booking,Payment,Review,Message

CREATE TABLE User(
user_id INTEGER Primary Key,
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
property_id INTEGER Primary Key,
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
booking_id INTEGER Primary Key,
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

CREATE TABLE Payment(
payment_id INTEGER Primary Key,
booking_id INT,
Foreign Key(booking_id) REFERENCES Booking(booking_id),
amount DECIMAL(10,2) NOT NULL,
payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
payment_method ENUM ('credit_card', 'paypal', 'stripe') NOT NULL,
INDEX(payment_id)
);

CREATE TABLE Review(
review_id INTEGER Primary Key,
property_id INT,
Foreign Key(property_id) REFERENCES Property(property_id),
user_id INTEGER,
Foreign Key(user_id) REFERENCES User(user_id),
rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
comment TEXT(500) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
INDEX(review_id)
);

CREATE TABLE Message(
message_id INTEGER Primary Key,
sender_id INT,
Foreign Key(sender_id) REFERENCES User(user_id),
recipient_id INT,
Foreign Key(recipient_id) REFERENCES User(user_id),
message_body TEXT NOT NULL,
sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
INDEX(message_id)
);