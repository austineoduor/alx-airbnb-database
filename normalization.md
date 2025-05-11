
*Potential Considerations and Minor Suggestions (mostly for clarity and best practices):*

User Table:

role
__ENUM: Using an ENUM is fine, but for greater flexibility and potential for adding more roles without altering the table structure, consider a separate__
Role
table. This avoids changing the
User
**table schema when new roles are needed. This is more about avoiding future modifications than a strict normalization issue. If the roles are truly fixed and unlikely to change, an ENUM is acceptable.**

Example of using a separate
Role
table:

*CREATE TABLE Role (<br>
    role_id UUID PRIMARY KEY, <br> 
    role_name VARCHAR(50) UNIQUE NOT NULL,  -- e.g., 'guest', 'host', 'admin'  <br>
    description TEXT NULL  -- Optional description of the role  <br>
    );<br>

CREATE TABLE User (<br>
    user_id UUID PRIMARY KEY,<br>
    first_name VARCHAR(255) NOT NULL,<br>
    last_name VARCHAR(255) NOT NULL,<br>
    email VARCHAR(255) UNIQUE NOT NULL,<br>
    password_hash VARCHAR(255) NOT NULL,<br>
    phone_number VARCHAR(20) NULL,<br>
    role_id UUID NOT NULL, -- Foreign key to Role table<br>
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,<br>
    FOREIGN KEY (role_id) REFERENCES Role(role_id)<br>
);*<br>

Property Table:

location

VARCHAR: Consider breaking down
location

__into more specific attributes (city, state/province, country, postal code). This would allow for more efficient searching and filtering by location. This is a normalization issue, but whether it's necessary depends on how location data will be used. If you often search "properties in California", having a single location string makes that harder. If you only ever need the entire location string, leaving it as is is fine.__

Example:

*CREATE TABLE Property (<br>
    property_id UUID PRIMARY KEY,<br>
    host_id UUID NOT NULL,<br>
    name VARCHAR(255) NOT NULL,<br>
    description TEXT NOT NULL,<br>
    street_address VARCHAR(255) NOT NULL,<br>
    city VARCHAR(255) NOT NULL,<br>
    state_province VARCHAR(255) NULL,  -- Or NOT NULL if required<br>
    postal_code VARCHAR(20) NULL,     -- Or NOT NULL if required<br>
    country VARCHAR(255) NOT NULL,<br>
    pricepernight DECIMAL(10,2) NOT NULL,<br>
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,<br>
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,<br>
    FOREIGN KEY (host_id) REFERENCES User(user_id)<br>
);*
Booking Table:

total_price
DECIMAL: The
total_price
can be derived from
Property.pricepernight
,
start_date
, and
end_date
__. Storing it as a separate attribute introduces redundancy. However, it's often practical to store the
total_price
for historical reasons (the pricepernight might change later, and you want to keep the booking's original price) and performance (avoiding recalculation).
This is a design decision between normalization and practicality. If you choose to store it, be very careful about consistency (e.g., using a trigger to ensure that total_price matches the calculated value).__
Payment Table:

payment_method
ENUM: Similar to the
role
in the
User
table, consider a separate
PaymentMethod
table if you expect the list of payment methods to expand frequently.

Example of using a separate
PaymentMethod
table:

*CREATE TABLE PaymentMethod (<br>
    payment_method_id UUID PRIMARY KEY,<br>
    payment_method_name VARCHAR(50) UNIQUE NOT NULL,  -- e.g., 'credit_card', 'paypal', 'stripe'<br>
    description TEXT NULL<br>
);

CREATE TABLE Payment (<br>
    payment_id UUID PRIMARY KEY,<br>
    booking_id UUID NOT NULL,<br>
    amount DECIMAL(10, 2) NOT NULL,<br>
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,<br>
    payment_method_id UUID NOT NULL,<br>
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),<br>
    FOREIGN KEY (payment_method_id) REFERENCES PaymentMethod(payment_method_id)<br>
);*

### Summary:

The schema is well-normalized. The primary suggestions involve breaking down location into more granular attributes in the Property table<br> and potentially using separate tables for Role and PaymentMethod to improve flexibility and maintainability. <br> The decision to store the total_price in the Booking
table is a trade-off between normalization and practicality.
