# alx-airbnb-database
**Database Specification - AirBnB**<br><br>

**Entities and Attributes**

**User**
__This table stores user information. Each user has a unique ID (UUID), a first name, last name, email (must be unique), <br> password hash, optional phone number, a role (guest, host, or admin), and a timestamp indicating when the account was created.__<br>

*user_id: Primary Key, UUID, Indexed<br>
first_name: VARCHAR, NOT NULL<br>
last_name: VARCHAR, NOT NULL<br>
email: VARCHAR, UNIQUE, NOT NULL<br>
password_hash: VARCHAR, NOT NULL<br>
phone_number: VARCHAR, NULL<br>
role: ENUM (guest, host, admin), NOT NULL<br>
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

**Property**

__Table stores information about rental properties, including a unique ID, the host who owns the property__,<br> __name, description, location, price per night, and timestamps for creation and updates.__<br>

*property_id: Primary Key, UUID, Indexed<br>
host_id: Foreign Key, references User(user_id)<br>
name: VARCHAR, NOT NULL<br>
description: TEXT, NOT NULL<br>
location: VARCHAR, NOT NULL<br>
pricepernight: DECIMAL, NOT NULL<br>
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP<br>
updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP*

**Booking**

__Table tracks reservations made by users for specific properties. It includes booking identifiers, <br> foreign keys to Property and Userbtables, start and end dates for the reservation, the total price, the booking status (pending, confirmed, or canceled), and a timestamp for when the booking was created.__

*booking_id: Primary Key, UUID, Indexed<br>
property_id: Foreign Key, references Property(property_id)<br>
user_id: Foreign Key, references User(user_id)<br>
start_date: DATE, NOT NULL<br>
end_date: DATE, NOT NULL<br>
total_price: DECIMAL, NOT NULL<br>
status: ENUM (pending, confirmed, canceled), NOT NULL<br>
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP*

**Payment**<br>

__The Payment table stores payment information related to bookings. Each payment is uniquely identified by a UUID ( payment_id ) and linked to a specific booking via booking_id.<br> It records the amount paid, the payment_date (defaulting to the current time), and the payment_method (credit card, PayPal, or Stripe).__

*payment_id: Primary Key, UUID, Indexed<br>
booking_id: Foreign Key, references Booking(booking_id)<br>
amount: DECIMAL, NOT NULL<br>
payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP<br>
payment_method: ENUM (credit_card, paypal, stripe), NOT NULL*

**Review**

__The Review table stores user ratings and comments on properties. It includes the review's ID, <br>the associated property and user IDs, a rating (1-5), the comment text, and a creation timestamp.__

*review_id: Primary Key, UUID, Indexed<br>
property_id: Foreign Key, references Property(property_id)<br>
user_id: Foreign Key, references User(user_id)<br>
rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL<br>
comment: TEXT, NOT NULL<br>
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP*

**Message**

__The Message table stores messages exchanged between users. It includes the message content (
message_body), <br>sender and recipient identifiers (sender_id, recipient_id referencing the User table), <br> a timestamp of when the message was sent ( sent_at), and a unique message identifier ( message_id).__

*message_id: Primary Key, UUID, Indexed<br>
sender_id: Foreign Key, references User(user_id)<br>
recipient_id: Foreign Key, references User(user_id)<br>
message_body: TEXT, NOT NULL
sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP*

***Constraints***

**User Table**

__Unique constraint on email.<br>
Non-null constraints on required fields.__

**Property Table**

__Foreign key constraint on host_id.<br>
Non-null constraints on essential attributes.__

**Booking Table**

Foreign key constraints on property_id and user_id.<br>
status must be one of pending, confirmed, or canceled.<br>
**Payment Table**
Foreign key constraint on booking_id, ensuring payment is linked to valid bookings.<br>
**Review Table**
Constraints on rating values (1-5).<br>
Foreign key constraints on property_id and user_id.

**Message Table**

Foreign key constraints on sender_id and recipient_id.<br>

**Indexing**

*__Primary Keys: Indexed automatically.__*<br>
*__Additional Indexes:__*<br>
   email in the User table.<br>
    property_id in the Property and Booking tables.<br>
    booking_id in the Booking and Payment tables.
