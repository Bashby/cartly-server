-- connect to database
\connect cartly

-- Insert into table 'address'
INSERT INTO address
(
 line1, line2, city, state, postcode, country, geolocation, timezone, classification
)
VALUES
(
 '200 Johnson Base', 'APT 415', 'Austin', 'TX', '78701', 'US', point(1.0, 1.0), 'America/Chica', 'Shipping'
);


-- Insert into table 'phone_number'
INSERT INTO phone_number
(
 phone_number, classification
)
VALUES
(
 '2814658574', 'Mobile'
);


-- Insert into table 'contact'
INSERT INTO contact
(
 email_address, url
)
VALUES
(
 'example@example.com', 'www.example.com'
);


-- Insert into table 'category'
INSERT INTO category
(
 name
)
VALUES
(
 'Fruit'
),
(
 'Vegetable'
);


-- Insert into table 'retailer'
INSERT INTO retailer
(
 name
)
VALUES
(
 'Test Retailer 1'
),
(
 'Test Retailer 2'
);


-- Insert into table 'store'
INSERT INTO store
(
 name, hours, rating
)
VALUES
(
 'Test Store 1', '9-5 M-F', '4.6'
),
(
 'Test Store 2', '8-4 M-F', '4.3'
);


-- Insert into table 'item'
INSERT INTO item
(
 name, description
)
VALUES
(
 'Test Item 1', 'Carrot'
),
(
 'Test Item 2', 'Apple'
),
(
 'Test Item 3', 'Banana'
),
(
 'Test Item 4', 'Pancake'
),
(
 'Test Item 5', 'Peach'
);


-- Insert into table 'requisition'
INSERT INTO requisition
(
 name
)
VALUES
(
 'Test Requisition 1'
),
(
 'Test Requisition 2'
);


-- Insert into table 'customer'
INSERT INTO customer
(
 name
)
VALUES
(
 'Test Customer 1'
),
(
 'Test Customer 2'
);

