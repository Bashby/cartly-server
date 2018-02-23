-- connect to database
\connect bodego


-- address
INSERT INTO address
(
 line1, line2, city, state, postcode, country, geolocation, timezone, classification
)
VALUES
(
 '200 Johnson Base', 'APT 415', 'Austin', 'TX', '78701', 'US', point(1.0, 1.0), 'America/Chica', 'Shipping'
);


-- phone_number
INSERT INTO phone_number
(
 phone_number, classification
)
VALUES
(
 '2814658574', 'Mobile'
);


-- contact
INSERT INTO contact
(
 email_address, url
)
VALUES
(
 'example@example.com', 'www.example.com'
);


-- category
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


-- retailer
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


-- store
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


-- item
INSERT INTO item
(
 name, description
)
VALUES
(
 'Carrot', 'This is a delicious carrot.'
),
(
 'Carrott', 'This is misspelled'
),
(
 'Carrot Pie', 'This is multiword'
),
(
 'Carrott Pie', 'This is misspelled, and multi word'
),
(
 'Test Item 1', 'Only description. Carrot carrot carrot carrot!!!'
),
(
 'Chicken', 'blahs blahh'
),
(
 'Chicken Soup', 'blahs blahh'
),
(
 'Chicken Broth', 'blahs blahh'
),
(
 'Water Melon', 'Yep, not a carrot or chicken'
),
(
 'Watermelon', 'one word! Yep, not a carrot or chicken'
),
(
 'Vegetable', 'This includes things like carrots, but not chicken'
);


-- requisition
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


-- customer
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